<?php 
	/**
	* 
	*/
	class Login
	{
		
		public static function isLoggedIn()
		{
			if(isset($_COOKIE['SNID']))
			{
				$result = DB::query('SELECT user_id FROM login_tokens WHERE token = :token',array(':token' => sha1($_COOKIE['SNID'])));
				if($result)
				{
					if(!(isset($_COOKIE['SNID_'])))
					{
						$cstrong = True;
						$token = bin2hex(openssl_random_pseudo_bytes(32, $cstrong));

						DB::query('INSERT INTO login_tokens VALUES (null, :token, :user_id)',array(':token' => sha1($token),':user_id' => $result[0]['user_id'] ));
						DB::query('DELETE FROM login_tokens WHERE token = :token',array(':token' => sha1($_COOKIE['SNID'])));

						setcookie("SNID", $token, time() + 60*60*24*7, '/', NULL, NULL, TRUE );
						setcookie("SNID_", '1', time() + 60*60*24*3, '/', NULL, NULL, TRUE );

					}
					return $result[0]['user_id'];
				}
			}
			return false;
		}
	
	}

 ?>