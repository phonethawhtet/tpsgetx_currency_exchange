
#ERROR 1


    [!] Automatically assigning platform `iOS` with version `12.0` on target `Runner` because no platform was specified. Please specify
    a platform for this target in your Podfile. See `https://guides.cocoapods.org/syntax/podfile.html#platform`.

     OR 
    [!] An error occurred while processing the post-install hook of the Podfile.

    undefined method `each_child' for #<Dir:0x00007fb56cd0ace0>
    Did you mean?  each_slice --------
 Solution => remove one section in Podfile under ios folder => post_install do |installer| ..... end