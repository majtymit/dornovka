<?php
class Validate {

	protected $type = "text";
	protected $minLength = 2;
	protected $maxLength = 20;
	public function setType($type) {
		$this->type = $type;
		return $this;
	}
	public function setMinLength($minLength) {
		$this->minLength = $minLength;
		return $this;
	}
	public function setMaxLength($maxLength) {
		$this->maxLength = $maxLength;
		return $this;
	}
	public function validateString($string) {
		switch($this->type) {
			case "email":
				if(preg_match('/^[^@]+@[a-zA-Z0-9\.\_\-]+\.[a-zA-Z]+$/', $string)) {
					return true;
				} else {
					return false;
				}
			break;
			case "text":
				if(preg_match("/^[a-zA-Z0-9\_\-\.\s\W]{" .$this->minLength . "," . $this->maxLength . "}$/", $string)) {
					return true;
				} else {
					return false;
				}
			break;
		}
	}

}
?>