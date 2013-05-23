# babushka-deps

My custom dependencies for Babushka.

## Installation

  0.  You need to be admin on the machine.
  
  1.  Check if you have a `/usr/local` directory on the target computer:

      ```bash
      file -b /usr/local
      ```
      
      If it doesn't say `directory` you don't have it, just continue to step 2.
      
      But if it does, ensure you have write access to it without sudo. One solution could be:
        
      ´´´bash
      sudo chown -R :staff /usr/local
      sudo chmod -R 775 /usr/local
      ```
  
  2.  Install babushka:
      
      ```bash
      sh -c "`curl https://babushka.me/up`"
      ```
      
      This will surely fail... Several times in fact.
      
      * It fails since it can't write to `/usr/local/bin`:
        
        ```bash
        sudo chown -R :staff /usr/local
        sudo chmod -R 775 /usr/local
        ```
        
      * It fails with `There are local changes in /usr/local/babushka`. Easiest way out:
        
        ```bash
        sudo rm -rf /usr/local/babushka
        sh -c "`curl https://babushka.me/up`"
        ```
      
      For latest information, see the [official docs][1].
     
  3.  Babushka itself doesn't need any compiler, however more or less anything else you use babushka to does, including the machine configurations in the dep repo. For that you need to install Command Line Tools from Apple.
      
      1. From within Xcode. Xcode > Preferences > Downloads
      2. By direct download from [Apple][2] (requires a free developer login).

  4.  Optionally install a machine config:

      ```bash
      babushka tregusti:mimer
      # or
      babushka tregusti:fenrir
      ```


  [1]: http://babushka.me/installing
  [2]: https://developer.apple.com/downloads