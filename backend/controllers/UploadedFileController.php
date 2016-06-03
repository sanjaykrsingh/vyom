<?php

namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use backend\models\UploadedFile;

/**
 * Controller implements the CRUD actions for  model.
 */
class UploadedFileController extends Controller {

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
     * Deletes an existing  model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id) {

        if (Yii::$app->request->isAjax) {
            $data = Yii::$app->request->post();
            
            $reference_type = (!empty($data['type']))?$data['type']:"";

            $model = $this->findModel($id);

            $upload_full_path = "";

            $path = \backend\models\UploadForm::getUploadPath($reference_type);
            if(empty($path)) return false;
            if ($path['upload_full_path']){
                
               @unlink($path['upload_full_path'] . $model->filename);
            }    
            $model->delete();

            \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
            return [
                'success' => 1,
                'code' => 200,
            ];
        }
    }

    /**
     * Finds the  model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return  the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id) {
        if (($model = UploadedFile::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

}
