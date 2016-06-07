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
    //controllerNamespace' => 'api\modules\v1\controllers',
    'bootstrap' => ['log'],   
    'modules' => [
        'v1' => [
            'basePath' => '@app/modules/v1',
            'class' => 'api\modules\v1\Module'
        ]
    ],
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
                    'class'  => 'yii\rest\UrlRule',
                    'controller'  => [
                        'v1/user'
                    ],
                    'extraPatterns' => [
                         'POST login' => 'login'
                    ]  
                 ],
                [
                    'class' => 'yii\rest\UrlRule', 
                    'controller' => 'v1/country'
                ],
                [
                    'class' => 'yii\rest\UrlRule', 
                    'controller' => 'v1/city',
                     'tokens' => [
                        '{id}' => '<id:\\w+>'
                    ]
                ],
                [
                    'class' => 'yii\rest\UrlRule', 
                    'controller' => 'v1/customer'
                ],
                [
                    'class' => 'yii\rest\UrlRule', 
                    'controller' => 'v1/restaurant'
                ],
                [
                    'class' => 'yii\rest\UrlRule', 
                    'controller' => 'v1/services'
                ],
                [
                    'class' => 'yii\rest\UrlRule', 
                    'controller' => 'v1/seen'
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