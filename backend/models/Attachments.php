<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "attachments".
 *
 * @property integer $id
 * @property string $name
 * @property string $model
 * @property integer $itemId
 * @property string $hash
 * @property string $mime
 * @property integer $size
 * @property string $path
 * @property string $type
 * @property integer $cover_image
 * @property string $created_at
 */
class Attachments extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'attachments';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'model', 'itemId', 'hash', 'mime', 'path'], 'required'],
            [['itemId', 'size', 'cover_image'], 'integer'],
            [['created_at'], 'safe'],
            [['name', 'hash', 'mime', 'type'], 'string', 'max' => 100],
            [['model', 'path'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'model' => Yii::t('app', 'Model'),
            'itemId' => Yii::t('app', 'Item ID'),
            'hash' => Yii::t('app', 'Hash'),
            'mime' => Yii::t('app', 'Mime'),
            'size' => Yii::t('app', 'Size'),
            'path' => Yii::t('app', 'Path'),
            'type' => Yii::t('app', 'Type'),
            'cover_image' => Yii::t('app', 'Cover Image'),
            'created_at' => Yii::t('app', 'Created At'),
        ];
    }
}
