import click, os, subprocess, tempfile, keyring
from wordpress_xmlrpc import Client, WordPressPost
from wordpress_xmlrpc.methods.posts import NewPost

@click.command()
def cli():

	if not (os.path.isfile("pressConfig.txt")):
		url = input("URL: ") + "/xmlrpc.php"
		usr = input("Username: ")
		file = open("pressConfig.txt", 'w+')
		file.write("URL: " + url + "\nUSERNAME: "+usr)
		file.close()
		keyring.set_password("press", usr, input("Password: "))
	else: 
		file = open("pressConfig.txt", "r")
		url = file.readline().strip("\n").split(": ")[1]
		usr = file.readline().strip("\n").split(": ")[1]
		file.close()
		pwd = keyring.get_password("press", usr)

	"""
	if (keyring.get_password("press", usr) is None):
		pwd = input("Password: ")
		keyring.set_password("press", usr, input("Password: "))
	else:
		pwd = keyring.get_password("press", usr)
	"""

	# Creating temporary file
	(fd, path) = tempfile.mkstemp()
	fp = os.fdopen(fd, 'w')
	fp.write('')
	fp.close()

	# Opening temporary write file in vi ... 
	editor = os.getenv('EDITOR', 'vi')
	print(editor, path)
	#Using TextEdit/another kind of app to do this ... 
	#	app_path = '/Applications/TextEdit.app'
	#	subprocess.call('Open %s %s' % (app_path, path), shell=True)  #Open /Applications/TextEdit.app <filename>
	# Below is equiv of "vi aside.$$" from raamdev 
	subprocess.call('%s %s' % (editor, path), shell=True)

	# Get the contents of the tempfile
	with open(path, 'r') as f:
		inContent = f.read()

	print(inContent)

	# If title not given, prompt for title ...
	inTitle = input("Title: ")

	# Printing post to the screen
	#print(inTitle + "\n\n" + inContent + "\n-----END-----")

	wp = Client(url, usr, pwd)
	post = WordPressPost()
	post.title = inTitle
	post.content = inContent
	post.post_status = 'draft'

	# Post and print what I assume is the post id...
	print(wp.call(NewPost(post)))

	f.close()

	# Deletes the file - equiv of rm.aside$$
	os.unlink(path) 