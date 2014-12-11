[Rewardr](https://fast-meadow-6272.herokuapp.com/) - Reward your employees!
================================

## Synopsis

FATS Inc. are proud to present their first product - [Rewardr](https://fast-meadow-6272.herokuapp.com/). This is a corporate reward system which forms part of our Final Project at Makers Academy. Rewardr allows Managers to issue their staff with a Reward in the forms of a badge via a Web App built with Ruby on Rails. It was designed to be simple to use for both Managers and Employees. It is not a social media site for the office. Employees log in and see their Dashboard which lists personal stats and a few company stats too. Managers have an additional page where they can select from a list of Rewards or even name their own.

Live on Heroku - https://fast-meadow-6272.herokuapp.com

![Screen Shot Home Page](https://raw.githubusercontent.com/HatStephens/FATS_Rewardr/master/Screen%20Shots/rewardr_main_page_image.png)
![Screen Shot Dashboard](https://raw.githubusercontent.com/HatStephens/FATS_Rewardr/master/Screen%20Shots/rewardr_dashboard_image.png)
![Screen Shot Reward Employee](https://raw.githubusercontent.com/HatStephens/FATS_Rewardr/master/Screen%20Shots/rewardr_reward_image.png)

## Technologies Used

Rails
Ruby
Javascript
jQuery
CSS
Postgres
Testing: RSpec, Capybara

## Job List

- [x] Setup Rails App
- [x] Create plan for next two days
- [x] Build back-end using Ruby and Postgres
- [x] Design wireframe for Front-End

## Favourite Code Snippet

~~~
 $('.button').on('click', function(){
    $('#reward_image').attr('src', images[i]);
    $('#badge_name').val(reward[i])
    if(i<6) {
       return i++;
    }
    else {
       return i=0;
    }
  });
~~~

This snippet allows a Manager to select an image and when they click "Reward" the image name gets passed through the form in a hidden field. This makes it much quicker and slicker for a Reward to be given and reduces the size of the form.

## Collaborators
- @andrewhercules - (http://www.github.com/andrewhercules)
- @fadieh - (http://www.github.com/fadieh)
- @HatStephens - (http://www.github.com/HatStephens)
- @Scully87 - (http://www.github.com/Scully87)

## Still to complete/refactor

- [ ] Some pages and elements could be more responsive to different window sizes
- [ ] More functionality could be added, for example, the ability to add a voucher code, make a Reward private, add a message with the Reward.....
- [ ] Feature tests need updating having adjusted HTML/CSS as some tests are now failing
