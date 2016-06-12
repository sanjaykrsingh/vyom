<?php

namespace backend\controllers;

use Yii;
use backend\models\Activities;
use backend\models\ActivitiesSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * ActivitiesController implements the CRUD actions for Activities model.
 */
class ActivitiesController extends Controller {

    public function behaviors() {
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
     * Lists all Activities models.
     * @return mixed
     */
    public function actionIndex() {
        $searchModel = new ActivitiesSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Activities model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id) {
        return $this->render('view', [
                    'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Activities model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate($id) {
        //ini_set("memory_limit","1024M");
        if (empty($id)) {
            \Yii::$app->getSession()->setFlash('error', 'Invalid Request');
            return $this->redirect(['site-seen/index']);
        }

        $model = new Activities();
        $modelSave = [];
        $postData = Yii::$app->request->post();
        $data = [];
        $data[0] = array("Activities" => array("site_seen_id" => '', "name" => '', 'valid_from' => '', 'valid_to' => '', 'retail_price' => '', 'discounted_price' => ''));
        $errors = [];
        $dataLength = 0;
        //print_r($postData);
        if (!empty($postData["Activities"]["name"])) {
            $dataLength = count($postData["Activities"]["name"]);
            for ($i = 0; $i < $dataLength - 1; $i++) {
                $data[$i]["Activities"]["site_seen_id"] = $id;
                $data[$i]["Activities"]["name"] = $postData["Activities"]["name"][$i];
                $data[$i]["Activities"]["valid_from"] = $postData["Activities"]["valid_from"][$i];
                $data[$i]["Activities"]["valid_to"] = $postData["Activities"]["valid_to"][$i];
                $data[$i]["Activities"]["retail_price"] = $postData["Activities"]["retail_price"][$i];
                $data[$i]["Activities"]["discounted_price"] = $postData["Activities"]["discounted_price"][$i];

                $modelSave[$i] = new Activities();
                $modelSave[$i]->load($data[$i]);
                if (!$modelSave[$i]->validate()) {
                    $errors[$i] = $modelSave[$i]->errors;
                }
            }
        } else {
            $record = Activities::find()->where(['site_seen_id' => $id])->asArray('Activities')->all();
            
            if(!empty($record)){
                foreach ($record as $key => $value) {
                        $findData[]['Activities'] = $value;
                }
                $data = $findData;
            }
            
        }
       // print_r($data);
            
       // print_r($errors);

        if (empty($errors) && !empty($postData)) {
            Activities::deleteAll(['site_seen_id' => $id]);
            for ($i = 0; $i < $dataLength - 1; $i++) {
                //echo $modelSave[$i]->id;
                //$this->findModel($modelSave[$i]->id)->delete();
                $modelSave[$i]->save();
            }
            \Yii::$app->getSession()->setFlash('success', 'Activities added successfully!');
            return $this->redirect(['site-seen/index']);
        } else {
            return $this->render('create', [
                        'model' => $model, 'data' => $data, 'errors' => $errors, 'site_seen_id' => $id
            ]);
        }
    }

    /**
     * Updates an existing Activities model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id) {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                        'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Activities model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id) {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Activities model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Activities the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id) {
        if (($model = Activities::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}
