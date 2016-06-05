<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\SiteConfig */

$this->title = 'Update Site Config: ' . ' ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Site Configs', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="site-config-update">

    

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
