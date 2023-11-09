# Mars Rovers Challenge
 
 ### Assumptions:
 ### Coordinates can not be of negative value.
 Coordinates can not be of negative value" means that the x and y coordinates of the rovers' positions on the Martian surface cannot have negative values. In other words, the rovers cannot be positioned at locations with negative x or y values. This assumption helps define the boundaries of the area in which the rovers can move and explore on Mars.

 ### Grid max position can not be negative values
  indicates that the maximum values for the x and y coordinates of the grid (or plateau) on which the Mars rovers operate cannot be negative. This ensures that the grid's boundary is defined in a way that avoids negative coordinates and establishes a non-negative coordinate space for the rovers to navigate within. It's a constraint that helps maintain the validity of the grid's dimensions and prevents rovers from going beyond its specified boundaries.

  ### Grid size defaults to (5,5)




## Installation
- Make you `ruby` is installed locally.
Visit this [guide](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-20-04) for installation steps using rbenv

- clone this repository to your local machine
- navigate to the repository follow terminal
- run the following command to start the commandline program
  ```bash
  bin/mars_rovers {x} {y}
  ```
  Place `{x}` and `{y}` with the sizr fo the grid (plateau)
  Keep in mind that (x,y) should be positive integers

  if `{x}` `{y}` are not passed, the max grid defaults to (5,5)

- the command above result it permissions related issue, try running commnd to grant the script file permission, then run the script again.
  
  ```bash
    chmod +x bin/mars_rovers
  ```

- You can also run the script directly with ruby

  ```bash
   ruby bin/mars_rovers 
  ```
 ## Rub gem
 - I have also published a ruby gem you can install and test it from there

    ```bash
      gem install mars_rovers_dellan
    ```

    ```bash
      ruby mars_rovers 5 5
    ```


## Testing the Script
- You will be prompted to enter an intial position of a rover `x y N`
- For example `1 2 N`
- Next you will be prompted to enter the motion command of the format `LRM`
    
    - `L`  - turn left
    - `R`  - turn right
    - `M`  - move

- Example command is `LMLMLMLMM`
  
- The new location will be printed.

- You can keep adding ass many rovers as you'd like
- Use the `print` command to output the locations for all the rovers added

  
![Screenshot](<Screenshot from 2023-08-22 03-58-07.png>)




