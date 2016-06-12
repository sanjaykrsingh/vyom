<?php

namespace api\modules\v1\controllers;

use yii;
use api\modules\v1\controllers\ApiController;
use yii\rest\ActiveController;
use api\modules\v1\models\LoginForm;

class UserController extends ActiveController {

    public $modelClass = 'common\models\User1';

    public function actionLogin() {
        $model = new LoginForm();
        if ($model->load(Yii::$app->getRequest()->getBodyParams(), '') && $user = $model->login()) {
            return ['access-token' => Yii::$app->user->identity->getAuthKey(), 'itineraryId' => $user->username,'name'=> $user->name,'email' => $user->email,'mobile_no' => $user->mobile_no,'day_description' => json_decode($user->day_description,true),];
        
        } else {
            $model->validate();
            return $model;
        }
    }

}