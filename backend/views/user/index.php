<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\jui\AutoComplete;
use common\models\User;
use yii\helpers\ArrayHelper;
use common\extensions\CommonHelper;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\UserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Users';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <?php
       $user_status = array('10'=>'Active','0'=>'Deactive'); 
       $users = User::find()->select(['value' => "concat(`username`)", 'label' => "concat(`username`)"])->asArray()->all();
    ?>
    <p>
        <?= Html::a('Create User', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            [
              'attribute' => 'username',
              'filter' => AutoComplete::widget([
                    'model'=>$searchModel, 
                    'attribute' => 'username',
                    'clientOptions' => 
                    [
                        'source' => $users,          
                    ],
                    'options' => array('class' => 'form-control')
                ]) 
            ],
             'email:email',
            [
                'attribute' => 'status',
                'value' => function ($data) use ($user_status){
                    return $user_status[$data->status];
                },
                'filter' => $user_status       
            ],
             'created_at',
             'updated_at',
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
