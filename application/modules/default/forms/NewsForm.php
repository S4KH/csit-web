<?php
class Form_NewsForm extends Zend_Form{
	public function __construct($option = null){
		parent::__construct($option);
		$this->setName('Add_News');
		$options = array('News', 'Announcement', 'Article', 'Event');
		$this->setLegend('Add News');
		$title = new Zend_Form_Element_Text('title');
		$title->setLabel('Title')
              ->addValidator('NotEmpty')
			  ->setAttribs(array('style' => 'height:25px;'))
			  ->setRequired();
        $validator = new Zend_Validate_StringLength();
        $validator->setMin(100);                      
		$image = new Zend_Form_Element_File('image');
		$image->setLabel('Upload thumbnail:')
      		  ->setDestination('C:/xampp/htdocs/sit/public/images/thumbnails')
              ->setMaxFileSize(8388608);
       	$image->addValidator('Count', false, 1);                // ensure only 1 file
		$image->addValidator('Size', false, 8388608);            // limit to 10 meg
		$image->addValidator('Extension', false, 'jpg,jpeg,png,gif');// only JPEG, PNG, and GIFs		
		$content = new Zend_Form_Element_Textarea('content');
		$content->setRequired(true)
                ->addValidator($validator)
				->setAttribs(array('style' => ' width:100%; height:300px;'));
		
		$add = new Zend_Form_Element_Submit('add');
		$add->setLabel('Proceed')
            ->removeDecorator('HtmlTag')
   		    ->class = "btn btn-info";
        
        $id = new Zend_Form_Element_Hidden('id');
        $id->removeDecorator('label');
		$this->addElements(array( $title, $image, $content,  $add, $id));
		$this->setMethod('post');
		$this->setAction(Zend_Controller_Front::getInstance()->getBaseUrl().'/user/add');				 
	}
}