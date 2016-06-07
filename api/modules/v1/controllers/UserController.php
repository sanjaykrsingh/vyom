<?php

namespace api\modules\v1\controllers;

use yii;
use api\modules\v1\controllers\ApiController;
use yii\rest\ActiveController;
use api\modules\v1\models\LoginForm;

class UserController extends ActiveController {

    public $modelClass = 'common\models\User';

    public function actionLogin() {
        $model = new LoginForm();
        if ($model->load(Yii::$app->getRequest()->getBodyParams(), '') && $model->login()) {
            return ['auth_key' => Yii::$app->user->identity->getAuthKey()];
        } else {
            $model->validate();
            return $model;
        }
    }

}