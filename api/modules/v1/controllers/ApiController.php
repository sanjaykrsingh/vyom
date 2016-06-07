<?php

namespace api\modules\v1\controllers;

use yii\rest\ActiveController;
use common\models\LoginForm;
use common\models\User;
use yii\filters\auth\CompositeAuth;
use yii\filters\auth\HttpBasicAuth;
use yii\filters\auth\HttpBearerAuth;
use yii\filters\auth\QueryParamAuth;


class ApiController extends ActiveController
{
    
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
}