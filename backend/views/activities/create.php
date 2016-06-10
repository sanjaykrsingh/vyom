<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Activities */

$this->title = Yii::t('app', 'Create Activities');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Activities'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="activities-create">
    <?= $this->render('_form', [
        'model' => $model,'data'=> $data,'errors' => $errors
    ]) ?>

</div>
