<?php
class Admin_Form_EventForm extends Zend_Form{
    public function __construct($option = null){
        parent::__construct($option);
        $this->setName('Add_Event');
        $ename = new Zend_Form_Element_Text('title');
        $ename->setLabel('Event Title')
              ->setAttribs(array('style' => 'width:400px;'))
              ->addValidator('NotEmpty')
              ->setRequired();
        $image = new Zend_Form_Element_File('image');
        $image->setLabel('Upload thumbnail:')
              ->setDestination('C:/xampp/htdocs/sit/public/images/thumbnails')
              ->setMaxFileSize(8388608);
        $image->addValidator('Count', false, 1);                // ensure only 1 file
        $image->addValidator('Size', false, 8388608);            // limit to 10 meg
        $image->addValidator('Extension', false, 'jpg,jpeg,png,gif');// only JPEG, PNG, and GIFs              
        $content = new Zend_Form_Element_Textarea('content');
        $content->setLabel('Content')
              ->addValidator('NotEmpty')
              ->setRequired()
              ->setAttribs(array('style' => ' width:100%; height:200px;'))
              ->class = "span4";            
        $date = new Zend_Form_Element_Text('forDate');
        $date->setLabel('Date Time:')
             ->addValidator('NotEmpty');
        $rno = new Zend_Form_Element_Text('rno');
        $rno->setLabel('Where')
            ->setAttribs(array('style' => 'width:400px;'))
            ->addValidator('NotEmpty')
            ->setRequired();
        $tag = new Zend_Form_Element_Text('tag');
        $tag->setLabel('Tags')
            ->setAttribs(array('style' => 'width:400px;'))
            ->addValidator('NotEmpty')
            ->setRequired();            
        $audience = new Zend_Form_Element_Text('aud');
        $audience->setLabel('Audience')
                 ->setAttribs(array('style' => 'width:400px;'))
                 ->addValidator('NotEmpty')
                 ->setRequired();                   
        $contact = new Zend_Form_Element_Text('cont');
        $contact->setLabel('Contact')
                 ->setAttribs(array('style' => 'width:400px;'))
                 ->addValidator('NotEmpty')
                 ->setRequired();
        $add = new Zend_Form_Element_Submit('add');
        $add->setLabel('Proceed')
            ->class = "btn btn-info";
        $id = new Zend_Form_Element_Hidden('id');
        $id->removeDecorator('label');
        $this->addElements(array($ename,$image, $date, $content, $rno, $contact, $tag, $audience,$add, $id));
        $this->setMethod('post');
        $this->setAction(Zend_Controller_Front::getInstance()->getBaseUrl().'/admin/events/add');              
    }
}