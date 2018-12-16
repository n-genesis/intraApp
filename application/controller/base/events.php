<?php
class ControllerBaseEvents extends Controller {
	public function lock($key) {
		return "<pre>Running controller event (LOCK) for HelloWorld [param:".$key."]</pre><br />";
	}
}