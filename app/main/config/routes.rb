# See https://github.com/voltrb/volt#routes for more info on routes

client '/traditional', controller: 'traditional'
client '/traditional/new', controller: 'traditional', action: 'new'
client '/traditional/{{ _id }}', controller: 'traditional', action: 'show'
client '/traditional/{{ _id }}/edit', controller: 'traditional', action: 'edit'

client '/about', action: 'about'

# Routes for login and signup, provided by user_templates component gem
client '/signup', component: 'user_templates', controller: 'signup'
client '/login', component: 'user_templates', controller: 'login'

# The main route, this should be last. It will match any params not
# previously matched.
client '/', {}
