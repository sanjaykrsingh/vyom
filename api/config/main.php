<?php

$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php')
   // require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-api',
    'basePath' => dirname(__DIR__),   
    'controllerNamespace' => 'api\controllers',
    'bootstrap' => ['log'],   
    'components' => [        
        'user' => [
            'identityClass' => 'common\models\User',
            'enableAutoLogin' => false,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'urlManager' => [
            'enablePrettyUrl' => true,
            'enableStrictParsing' => true,
            'showScriptName' => false,
            'rules' => [
                [
                    'class' => 'yii\rest\UrlRule', 
                    'controller' => 'country'
                ],
                [
                    'class' => 'yii\rest\UrlRule', 
                    'controller' => 'city'
                ],
                [
                    'class' => 'yii\rest\UrlRule', 
                    'controller' => 'customer'
                ],
                [
                    'class' => 'yii\rest\UrlRule', 
                    'controller' => 'restaurant'
                ],
                [
                    'class' => 'yii\rest\UrlRule', 
                    'controller' => 'services'
                ],
                [
                    'class' => 'yii\rest\UrlRule', 
                    'controller' => 'siteseen'
                ]
            ],        
        ],
        'request' => [
           'parsers' => [
                'application/json' => 'yii\web\JsonParser',
                'application/xml' => 'yii\web\JsonParser',
        ]
]
    ],
    'params' => $params,
];