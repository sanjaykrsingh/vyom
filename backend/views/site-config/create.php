<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\SiteConfig */

$this->title = 'Create Site Config';
$this->params['breadcrumbs'][] = ['label' => 'Site Configs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-config-create">

    

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
