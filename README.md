# flutter_pokedex

This is a Flutter Pokedex Project.

The main.dart file runs the homepage.dart containing the basic application launch codes. The home_page.dart file contains widgets and various actions for the screen. These are app_title.dart and pokemon_list.dart

app_title.dart file is showing us that HomePage's appBar.
With the pokedex_api.dart file under the services folder, we connect to the API and access the data. And then we are using this data in pokemon_list.dart file.

pokemon_list.dart file is showing us with GridView that Pokemon's Name, Pokemon's type and Pokemon's image.
The pokemon_list.dart also wrapped with InkWell.
When we click a Pokemon's Grid,we are redirected to poke_info.dart page. 
The poke_info.dart page contains more Pokemon's information.

Additionally, This application has different view in landscape and portrait mode.
It has a different view both in home_page.dart and in detail.dart

I didn't use any "state management" system as the application is small in size and easy to manage.
