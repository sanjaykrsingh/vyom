<?php

namespace backend\controllers;

use Yii;
use backend\models\City;
use backend\models\CitySearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use backend\models\UploadForm;
use yii\web\UploadedFile;

/**
 * CityController implements the CRUD actions for City model.
 */
class CityController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all City models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new CitySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

   
    /**
     * Displays a single City model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id) {
        $model = $this->findModel($id);
        $imageModel = new UploadForm();
        $bigImageList = $imageModel->getImageList($id, 'City', 'Big');
        $smallImageList = $imageModel->getImageList($id, 'City', 'Small');

        return $this->render('view', [
                    'model' => $model, 'bigImageList' => $bigImageList, 'smallImageList' => $smallImageList
        ]);
    }

    /**
     * Creates a new City model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new City();

        $imageModel = new UploadForm();
        print_r(Yii::$app->request->post());
        if ($model->load(Yii::$app->request->post()) && $imageModel->load(Yii::$app->request->post())) {
            $transaction = Yii::$app->db->beginTransaction();
            $isValid = $model->validate();
            print_r($model->errors);
            if ($isValid) {
                $model->save(false);
                $isValid = false;
                $imageModel->imageFiles = UploadedFile::getInstances($imageModel, 'imageFiles');
                $imageModel->smallFiles = UploadedFile::getInstances($imageModel, 'smallFiles');

                if ($imageModel->upload($model->id, 'City')) {
                    $transaction->commit();
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    $transaction->rollBack();
                }
            }
        }
        return $this->render('create', [
                    'model' => $model, 'imageModel' => $imageModel
        ]);
    }

    /**
     * Updates an existing City model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id) {
        $model = $this->findModel($id);
        $imageModel = new UploadForm();
        $bigImageList = $imageModel->getImageList($id, 'City', 'Big');
        $smallImageList = $imageModel->getImageList($id, 'City', 'Small');
        
        if ($model->load(Yii::$app->request->post()) && $imageModel->load(Yii::$app->request->post())) {
            $transaction = Yii::$app->db->beginTransaction();
            $isValid = $model->validate();
            
            if ($isValid) {
                $model->save(false);
                
                $isValid = false;
                $imageModel->imageFiles = UploadedFile::getInstances($imageModel, 'imageFiles');
                $imageModel->smallFiles = UploadedFile::getInstances($imageModel, 'smallFiles');
                
                if ($imageModel->upload($model->id, 'City')) {
                    $transaction->commit();
                    return $this->redirect(['view', 'id' => $model->id]);
                } else {
                    $transaction->rollBack();
                }
            }
        }
        return $this->render('update', [
                    'model' => $model, 'imageModel' => $imageModel, 'bigImageList' => $bigImageList, 'smallImageList' => $smallImageList
        ]);
    }

    /**
     * Deletes an existing City model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the City model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return City the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = City::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
