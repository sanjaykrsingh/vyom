<?php

namespace api\modules\v1\controllers;

use api\modules\v1\controllers\ApiController;
use yii\data\ActiveDataProvider;

class ItineraryController extends ApiController {

    public $modelClass = 'backend\models\Customer';
    
    public function actions()
    {
        $actions = parent::actions();
        unset($actions['index']);
        unset($actions['view']);
        return $actions;
    }
    public function actionIndex() {
        try {
            $model = new $this->modelClass;
            $provider = new ActiveDataProvider([
                'query' => $model->find()->where(['type' => 'customer']),
                'pagination' => false
            ]);
        } catch (Exception $ex) {
            throw new \yii\web\HttpException(500, 'Internal server error');
        }

        if ($provider->getCount() <= 0) {
            throw new \yii\web\HttpException(404, 'Object not found!');
        } else {
            return $provider;
        }
    }
    
    public function actionView($id) {
        $user = [];
        try {
            $model = new $this->modelClass;
            
            $accessToken = $_GET['access-token'];
            $user  = $model->find()->where(['type' => 'customer','username'=>$id, 'auth_key' => $accessToken])->one();
           // print_r($user);die;
            
        } catch (Exception $ex) {
            throw new \yii\web\HttpException(500, 'Internal server error');
        }
        
        if (empty($user) || empty($user->username)) {
            throw new \yii\web\HttpException(404, 'Object not found Or Unauthorized');
        } else {
            return ['itineraryId' => $user->username,'name'=> $user->name,'email' => $user->email,'mobile_no' => $user->mobile_no,'day_description' => json_decode($user->day_description,true),];
        }
    }

}
