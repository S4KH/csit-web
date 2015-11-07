<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
	protected function _initAutoload(){
		$modelLoader=new Zend_Application_Module_Autoloader(array(
				'namespace' => '',
				'basePath' => APPLICATION_PATH.'/modules/default'));

		if (Zend_Auth::getInstance()->hasIdentity()){
			Zend_Registry::set('role', Zend_Auth::getInstance()->getStorage()->read()->role);
		} else {
			Zend_Registry::set('role', 'guests');
		}
//		
		$acl= new Model_NewsAcl;
		$auth= Zend_Auth::getInstance();
		$fc=Zend_Controller_Front::getInstance();
		$this->_acl=new Model_NewsAcl(); 
		$fc->registerPlugin(new Plugin_AccessCheck($acl, $auth));
		
		return $modelLoader; 
	}

	protected function _initFacebook()
    {
        $config = new Zend_Config_Ini(APPLICATION_PATH . '/configs/application.ini', APPLICATION_ENV);
        Zend_Registry::set('fbconfig', $config->fb);
    }
	
	function _initViewHelpers(){
		
		$this->bootstrap('layout');
		$layout = $this->getResource('layout');
		$view = $layout->getView();
		$view->setEncoding('UTF-8');
		
        $translate=new Zend_Translate('gettext',
                        APPLICATION_PATH.'/lang',
                        null,
                        array('scan'=>Zend_Translate::LOCALE_FILENAME));
        $session=new Zend_Session_Namespace('sit');
        $locale=new Zend_Locale();
        
        if (isset($session->language)){
            $requestedLanguage = $session->language;
            $locale->setLocale($requestedLanguage);
        } else {
            $locale->setLocale(Zend_Locale::BROWSER);
            $requestedLanguage = key($locale->getBrowser());    
        }
        if (in_array($requestedLanguage, $translate->getList())){
            $language = $requestedLanguage;
        } else {
            $language = 'mn';
        }
        $translate->setLocale($language);
        $view->translate=$translate;
        $view->language=$language;
		
		
	//	Zend_Dojo::enableView($view);
		$view->doctype('HTML4_STRICT');
		$view->headMeta()->appendHttpEquiv('Content-type','text/html;charset=utf-8')
						 ->appendName('description','Мэдээллийн Технологийн Сургууль');
		
		$view->headTitle()->setSeparator(' : ');
		$view->headTitle('МТС');
		
		
		
	}	
	

}

