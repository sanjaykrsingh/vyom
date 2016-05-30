<?php

namespace backend\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "uploaded_file".
 *
 * @property integer $id
 * @property integer $reference_id
 * @property string $reference_type
 * @property string $name
 * @property string $filename
 * @property integer $size
 * @property string $path
 * @property string $type
 * @property integer $cover_image
 * @property string $created_at
 */
class UploadedFile extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'uploaded_file';
    }
    
    
    public function behaviors()
    {
        return [
            'timestamp' => [
                'class' => TimestampBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['created_at']
                ],
                'value' => function($event) {
                    $format = "Y-m-d h:i:s"; // any format you wish
                    return date($format); 
                }
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'filename', 'path'], 'required'],
            [['size', 'cover_image'], 'integer'],
            [['reference_type','type'], 'string'],
            [['created_at','reference_id'], 'safe'],
            [['name'], 'string', 'max' => 100],
            [['filename', 'path'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'reference_id' => Yii::t('app', 'Reference ID'),
            'reference_type' => Yii::t('app', 'Reference Type'),
            'name' => Yii::t('app', 'Name'),
            'filename' => Yii::t('app', 'Filename'),
            'size' => Yii::t('app', 'Size'),
            'path' => Yii::t('app', 'Path'),
            'cover_image' => Yii::t('app', 'Cover Image'),
            'created_at' => Yii::t('app', 'Created At'),
        ];
    }
    
    
    public function getImageList($reference_id , $reference_type, $type = null) {
        
       $where = "reference_id = $reference_id AND reference_type = '$reference_type'";
       
       if($type){
           $where .= " AND type = '$type'";
       }
        
       $data = $this->find()->where($where)->asArray()->all();
               //->orderBy(array(new \yii\db\Expression('FIELD (trim(replace(`package_tracking`.fabone_status, "\t", "")), ' . $type . ')')));
       
       if(!empty($data)){
           return $data;
       }
       return [];
        
    }
    
    public function deleteAllImage($reference_id , $reference_type, $type = null) {
        
       $where = "reference_id = $reference_id AND reference_type = '$reference_type'";
       
       if($type){
           $where .= " AND type = '$type'";
       }
        
       $data = $this->deleteAll($where);
       if(!empty($data)){
           return $data;
       }
       return [];
        
    }
}
