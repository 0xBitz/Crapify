import net.http
import os
import term
import time
import rand

const(
	valid_file = "file_here"
)

pub fn clear(){
	$if windows{
		os.system('cls')
	} $else {
		os.system('clear')
	}
}

pub fn main(){
	clear()
	print(" ▄████▄   ██▀███   ▄▄▄       ██▓███   ██▓  █████▒▓██   ██▓\n")
	print("▒██▀ ▀█  ▓██ ▒ ██▒▒████▄    ▓██░  ██▒▓██▒▓██   ▒  ▒██  ██▒\n")
	print("▒▓█    ▄ ▓██ ░▄█ ▒▒██  ▀█▄  ▓██░ ██▓▒▒██▒▒████ ░   ▒██ ██░\n")
	print("▒▓▓▄ ▄██▒▒██▀▀█▄  ░██▄▄▄▄██ ▒██▄█▓▒ ▒░██░░▓█▒  ░   ░ ▐██▓░\n")
	print("▒ ▓███▀ ░░██▓ ▒██▒ ▓█   ▓██▒▒██▒ ░  ░░██░░▒█░      ░ ██▒▓░\n")
	print("░ ░▒ ▒  ░░ ▒▓ ░▒▓░ ▒▒   ▓▒█░▒▓▒░ ░  ░░▓   ▒ ░       ██▒▒▒ \n")
	print("  ░  ▒     ░▒ ░ ▒░  ▒   ▒▒ ░░▒ ░      ▒ ░ ░       ▓██ ░▒░ \n")
	print("░          ░░   ░   ░   ▒   ░░        ▒ ░ ░ ░     ▒ ▒ ░░  \n")
	print("░ ░         ░           ░  ░          ░           ░ ░     \n")
	print("[ Crapify Spotify Account Gen ] [ Github -> github.com/CrypticDev ]\n")
	if os.exists(valid_file){
		print("[ Crapify Saving Valid Account to ] -> $valid_file \n")
		crapify_gen()
	} else {
		print(" [ Crapify Can't Find The List ] -> $valid_file \n")
		time.sleep(5 * time.second)
		os.create('$valid_file') or {
			print("[ Crapify Couldn't Make the List ] -> $valid_file \n")
			return
		}
		print(" [ Crapify Created The List ] -> $valid_file \n")
		time.sleep(2 * time.second)
		print("[ Crapify Saving Valid Account to ] -> $valid_file \n")
		crapify_gen()
	}
}

pub fn crapify_gen(){
	for {
		email := rand.string_from_set('QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcbnm123456789', 5)
		pass := rand.string_from_set('QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcbnm123456789', 7)
		username := rand.string_from_set('QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcbnm123456789', 7)

		data := {
			'birth_day': '01',
            'birth_month': '01',
            'birth_year': '1969',
            'creation_flow': '',
            'creation_point': '"https://www.spotify.com/us/',  
            'displayname': '${username}',
            'username': '${username}',
            'gender': 'neutral',
            'iagree': '1',
            'key': 'a1e486e2729f46d6bb368d6b2bcda326',
            'platform': 'www',
            'referrer': 'https://www.spotify.com/us/',
            'send-email': '0',
            'thirdpartyemail': '0',
            'email': '${email}@crapify.gen',
            'password': '${pass}',
            'password_repeat': '${pass}'
		}
		
		mut make_acc := http.new_request(.get, 'https://spclient.wg.spotify.com/signup/public/v1/account', "data=${data}") or {
			print(term.red("[ Crapify Gen -> Err ( Can't Gen account ) \n"))
			continue
		}
		make_acc.add_header(.authority, 'spclient.wg.spotify.com')
		make_acc.add_header(.user_agent, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36')
		make_acc.add_header(.sec_fetch_mode, 'cors')
		make_acc.add_header(.sec_fetch_dest, 'empty')
		make_acc.add_header(.sec_fetch_site, 'same')
		mut resp := make_acc.do() or {
			print(" [ Crapify Can't Make The Account -> ${email}@crapify.gen:${pass} ] \n")
			continue
		}
		print("[ Crapify Made The Account -> ${email}@crapify.gen:${pass} ] \n")
		os.write_file('${valid_file}', 'Crapify Made An Account -> ${email}@crapify.gen:${pass} ') or {
			print("[ Crapify Can't Save Email & Pass To List ] -> ${valid_file} \n")
			continue
		}
		
	}
}

