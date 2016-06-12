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
        
        try {
            $model = new $this->modelClass;
            $provider = new ActiveDataProvider([
                'query' => $model->find()->where(['type' => 'customer','username'=>$id]),
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

}
