<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "product".
 *
 * @property int $id
 * @property string $title
 * @property string $Description
 * @property resource $Pictures
 * @property double $Cost
 */
class Product extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'Description', 'Pictures', 'Cost'], 'required'],
            [['Pictures'], 'string'],
            [['Cost'], 'number'],
            [['title', 'Description'], 'string', 'max' => 256],
            [['review_text'], 'string'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'Description' => 'Description',
            'Pictures' => 'Pictures',
            'Cost' => 'Cost',
        ];
    }

    public function getReview_text(){
        return $this->hasOne(review::className(), ['id' => 'review_id' ]);
    }
}
