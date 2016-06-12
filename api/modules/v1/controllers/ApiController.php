<?php

namespace api\modules\v1\controllers;

use yii\rest\ActiveController;
use yii\filters\auth\CompositeAuth;
use yii\filters\auth\HttpBasicAuth;
use yii\filters\auth\HttpBearerAuth;
use yii\filters\auth\QueryParamAuth;
use yii\data\ActiveDataProvider;

class ApiController extends ActiveController
{
    
    public $searchInArray = ['type','city_id'];
    
    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors['authenticator'] = [
            //'class' => HttpBasicAuth::className(),
            'class' => CompositeAuth::className(),
             'authMethods' => [
                 HttpBasicAuth::className(),
                 HttpBearerAuth::className(),
                 QueryParamAuth::className(),
             ],
        ];        
        return $behaviors;
    }
    
    
    public function actionSearch() {
        $getData = $_GET;
        if(isset($getData) && !empty($getData) ){
            if(isset($getData['access-token']))
                unset ($getData['access-token']);
            if(isset($getData['_format']))
                unset ($getData['_format']);

        }    
        
        if (!empty($getData)) {
            $model = new $this->modelClass;
            foreach ($getData as $key => $value) {
                
                if (!$model->hasAttribute($key) || !in_array($key, $this->searchInArray)) {
                    throw new \yii\web\HttpException(404, 'Invalid attribute:' . $key);
                }
            }
            try {
                $provider = new ActiveDataProvider([
                    'query' => $model->find()->where($getData),
                    'pagination' => false
                ]);
            } catch (Exception $ex) {
                throw new \yii\web\HttpException(500, 'Internal server error');
            }

            if ($provider->getCount() <= 0) {
                throw new \yii\web\HttpException(404, 'No entries found with this parameter(s)');
            } else {
                return $provider;
            }
        } else {
            throw new \yii\web\HttpException(400, 'There are no parameters to find');
        }
    }
    
}