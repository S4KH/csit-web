<?php
class Admin_Form_ThumbForm extends Zend_Form{

    public function __construct($option = null){
        parent::__construct($option);
        $this->setName('file');
        $this->setAttrib('class', 'form-inline');
        
        $filename=new Zend_Form_Element_Text('filename');
        $filename ->setLabel('Файлын нэр:')
                  ->setRequired()
                  ->setAttrib('class', 'input-large');
                  
        $image=new Zend_Form_Element_File('image');
        $image->setLabel('File:');
        
        $add = new Zend_Form_Element_Submit('add');
        $add->setLabel('Add image');
        $add->setAttrib('class', 'btn');
        
        $this->addElements(array($filename,$image, $add));
        $this->setMethod('post');
        $this->setAction(Zend_Controller_Front::getInstance()->getBaseUrl().'/admin/thumb/save');       
    }
}