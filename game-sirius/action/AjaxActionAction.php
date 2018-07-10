<?php
	require_once("action/CommonAction.php");

	class AjaxActionAction extends CommonAction {
        public $result;

		public function __construct() {
			parent::__construct(CommonAction::$VISIBILITY_MEMBER);
		}

		protected function executeAction() {

			$data = [];
			$data["key"] = $_SESSION["key"];
			$data["skill-name"] = $_POST["attack"];

			$this->result = CommonAction::callAPI("action", $data);
			

        	}
	}