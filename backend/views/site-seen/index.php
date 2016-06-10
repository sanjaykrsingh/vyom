<?php

use yii\helpers\Html;
use yii\grid\GridView;

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
            'address1',
            // 'address2',
             'phone_no1',
            // 'phone_no2',
            // 'latitude',
            // 'longitude',
            // 'created_at',
            // 'updated_at',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>


</div>
