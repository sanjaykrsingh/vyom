<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\SiteSeenSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Site Seens');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-seen-index">

    
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Site Seen'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

   <?php
$cityObj = new backend\models\City();
$cities = $cityObj->getAllCities();
?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //'id',
            [
                'attribute' => 'city_id',
                'value' => 'cities.name',                
                'filter' => yii\helpers\ArrayHelper::map($cities , 'id', 'name')
            ],
            
            'title',
            //'Description:ntext',
            'open_time',
            'close_time',
            'address',
             'phone_no1',
            // 'phone_no2',
            // 'latitude',
            // 'longitude',
            // 'created_at',
            // 'updated_at',

           [
                'class' => 'yii\grid\ActionColumn',
                'template' => '{update} {view} {delete} {new_action1}',
                'buttons' => [
                    'new_action1' => function ($url, $model) {
                        return Html::a('<span class="glyphicon glyphicon-plus"></span>', $url, [
                                    'title' => Yii::t('app', 'New Action1'),
                        ]);
                    }
                        ],
                        'urlCreator' => function ($action, $model, $key, $index) {
                    if ($action === 'new_action1') {
                        return Url::to(['activities/create', 'id' => $model->id]);
                        
                    }
                    if ($action === 'update') {
                        return Url::to(['update', 'id' => $model->id]) ;
                        
                    }
                    if ($action === 'view') {
                        return Url::to(['view', 'id' => $model->id]);
                        
                    }
                    if ($action === 'delete') {
                        return Url::to(['delete', 'id' => $model->id]);
                        
                    }
                }
                    ],
        ],
    ]); ?>


</div>
