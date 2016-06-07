<?php

namespace api\modules\v1\controllers;

use api\modules\v1\controllers\ApiController;
use common\models\LoginForm;

class LoginController extends ApiController
{ 
    public $modelClass = 'common\models\User'; 
    
    public function actionLogin()
    {
        $model = new LoginForm();
        if ($model->load(Yii::$app->getRequest()->getBodyParams(), '') && $user = $model->login()) {
            return ['access-token' => Yii::$app->user->identity->getAuthKey(), 'itinerary_id' => $user->username,'name'=> $user->name,'email' => $user->email,'mobile_no' => $user->mobile_no];
        } else {
            $model->validate();
            return $model;
        }
    }
}