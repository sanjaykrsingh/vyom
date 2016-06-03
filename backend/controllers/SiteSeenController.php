<?php

namespace backend\controllers;

use Yii;
use backend\models\SiteSeen;
use backend\models\SiteSeenSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use backend\models\UploadForm;
use yii\web\UploadedFile;

/**
 * SiteSeenController implements the CRUD actions for SiteSeen model.
 */
class SiteSeenController extends Controller
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
     * Lists all SiteSeen models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new SiteSeenSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single SiteSeen model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id) {
        $model = $this->findModel($id);
        $imageModel = new UploadForm();
        $bigImageList = $imageModel->getImageList($id, 'SiteSeen', 'Big');
        $smallImageList = $imageModel->getImageList($id, 'SiteSeen', 'Small');

        return $this->render('view', [
                    'model' => $model, 'bigImageList' => $bigImageList, 'smallImageList' => $smallImageList
        ]);
    }

    /**
     * Creates a new SiteSeen model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new SiteSeen();

        $imageModel = new UploadForm();
        
        if ($model->load(Yii::$app->request->post()) && $imageModel->load(Yii::$app->request->post())) {
            $transaction = Yii::$app->db->beginTransaction();
            $isValid = $model->validate();
            
            if ($isValid) {
                $model->save(false);
                $isValid = false;
                $imageModel->imageFiles = UploadedFile::getInstances($imageModel, 'imageFiles');
                $imageModel->smallFiles = UploadedFile::getInstances($imageModel, 'smallFiles');

                if ($imageModel->upload($model->id, 'SiteSeen')) {
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
     * Updates an existing SiteSeen model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id) {
        $model = $this->findModel($id);
        $imageModel = new UploadForm();
        $bigImageList = $imageModel->getImageList($id, 'SiteSeen', 'Big');
        $smallImageList = $imageModel->getImageList($id, 'SiteSeen', 'Small');
        if ($model->load(Yii::$app->request->post()) && $imageModel->load(Yii::$app->request->post())) {
            $transaction = Yii::$app->db->beginTransaction();
            $isValid = $model->validate();
            print_r($model->errors);
            if ($isValid) {
                $model->save(false);
                $isValid = false;
                $imageModel->imageFiles = UploadedFile::getInstances($imageModel, 'imageFiles');
                $imageModel->smallFiles = UploadedFile::getInstances($imageModel, 'smallFiles');

                if ($imageModel->upload($model->id, 'SiteSeen')) {
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
     * Deletes an existing SiteSeen model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id) {

        $model = $this->findModel($id);
        $model->delete();
        $imageModel = new UploadForm();
        $imageModel->deleteAllUploadedFile($id, 'SiteSeen');
        return $this->redirect(['index']);
    }

    /**
     * Finds the SiteSeen model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return SiteSeen the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = SiteSeen::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
