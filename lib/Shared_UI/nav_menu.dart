class NavMenuItem
{
  String title;
  //We defined route as a Function because of when we create a List of NavMenuItem
  //We don't want the class to be created .. only when i call him when we click on the name :))
  Function route;

  NavMenuItem(this.title , this.route);
}