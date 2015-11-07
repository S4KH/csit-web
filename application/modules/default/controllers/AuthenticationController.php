<?php

class AuthenticationController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        
    }

    public function loginAction()
    {
        if(Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index/index');
        }
        $request = $this->getRequest();
        $form = new Form_LoginForm();
        $message = '';
        if($request->isPost()){
            if($form->isValid($this->_request->getPost())){
                if($form->getValue('rMe')){    
                    $seconds  = 60 * 60 * 24 * 7;
                    Zend_Session::rememberMe($seconds);
                }else
                    Zend_Session::forgetMe();
                $authAdapter = $this->getAuthAdapter();
                $username = $form->getValue('username');
                $password = $form->getValue('password');
				$rm = $form->getValue('rMe');
	            
                $authAdapter->setIdentity($username)
                            ->setCredential(md5($password));
                $auth = Zend_Auth::getInstance();
                $result = $auth->authenticate($authAdapter);

                if($result->isValid()){
                    $identity = $authAdapter->getResultRowObject();
                    $storage = $auth->getStorage();
                    $storage->write($identity);
                    $this->_redirect('index/index');
                } else {
                    echo 'Invalid username password';
                }                    
            }
        }
        

    }

    public function logoutAction()
    {
        $storage = new Zend_Auth_Storage_Session();
        $storage->clear();
        $this->_redirect('index/index');
    }

    private function getAuthAdapter(){
        $users = new Model_DbTable_Users();
        $authAdapter = new Zend_Auth_Adapter_DbTable($users->getAdapter(),'user');
        $authAdapter->setTableName('user')
                    ->setIdentityColumn('username')
                    ->setCredentialColumn('password');
        return $authAdapter;                    
    }


}





