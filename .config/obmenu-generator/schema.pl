#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(...)},
    beg:       begin of a category                        {beg => ["name", "icon"]},
    end:       end of a category                          {end => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [

	{sep => 'DESKTOP MENU'},
    
    #          COMMAND                 LABEL              ICON
    {item => ['urxvt',             'Terminal',         'utilities-terminal']},
    {item => ['thunar',            'File Manager',     'system-file-manager']},
    {item => ['xdg-open https://', 'Web Browser',      'web-browser']},

    {sep => 'CATEGORIES'},

    #          NAME            LABEL                ICON
    {cat => ['utility',     'Accessories', 'applications-utilities']},
    {cat => ['development', 'Development', 'applications-development']},
    {cat => ['education',   'Education',   'applications-science']},
    {cat => ['game',        'Games',       'applications-games']},
    {cat => ['graphics',    'Graphics',    'applications-graphics']},
    {cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
    {cat => ['network',     'Network',     'applications-internet']},
    {cat => ['office',      'Office',      'applications-office']},
    {cat => ['other',       'Other',       'applications-other']},
    {cat => ['settings',    'Settings',    'applications-accessories']},
    {cat => ['system',      'System',      'applications-system']},

    # Generic Advanced Settings
    {sep       => undef},
    {obgenmenu => ['Advanced Settings', 'applications-engineering']},
    
    {sep => 'SESSIONS'},

    ## Screenshot Menu
    {raw  => q(<item label="Refresh" icon="/home/ryk/.config/obmenu-generator/icons/4778abdbe896daece3cdf6700abc1fd7.png">
                <action name="Restart"/>
               </item>)},
               
    {sep  => undef},
    {beg  => ["Screenshot", "deepin-screenshot"]},
    
    {raw  => q(<item label="Now.." icon="/home/ryk/.config/obmenu-generator/icons/a60bc13b3afe21473e55f2bb2d7592a0.png">
                <action name="Execute">
                <command>scrot -e 'mv $f ~/Pictures/'</command>
                </action>
               </item>)},
    {raw  => q(<item label="Shot in 5sec" icon="/home/ryk/.config/obmenu-generator/icons/a60bc13b3afe21473e55f2bb2d7592a0.png">
                <action name="Execute">
                <command>scrot -d 5 -e 'mv $f ~/Pictures/'</command>
                </action>
               </item>)},
    {raw  => q(<item label="Select Window.." icon="/home/ryk/.config/obmenu-generator/icons/a60bc13b3afe21473e55f2bb2d7592a0.png">
                <action name="Execute">
                <command>scrot -s -e 'mv $f ~/Pictures/'</command>
                </action>
               </item>)},
    {sep  => 'WITH POINTER CAPTURED'},
    {raw  => q(<item label="Now.." icon="/home/ryk/.config/obmenu-generator/icons/a60bc13b3afe21473e55f2bb2d7592a0.png">
                <action name="Execute">
                <command>scrot -p -e 'mv $f ~/Pictures/'</command>
                </action>
               </item>)},
    {raw  => q(<item label="Shot in 5sec" icon="/home/ryk/.config/obmenu-generator/icons/a60bc13b3afe21473e55f2bb2d7592a0.png">
                <action name="Execute">
                <command>scrot -p -d 5 -e 'mv $f ~/Pictures/'</command>
                </action>
               </item>)},
    {raw  => q(<item label="Select Window.." icon="/home/ryk/.config/obmenu-generator/icons/a60bc13b3afe21473e55f2bb2d7592a0.png">
                <action name="Execute">
                <command>scrot -p -s -e 'mv $f ~/Pictures/'</command>
                </action>
               </item>)},
    
    {end  => undef},
    
    ## Lock
    {beg  => ["Lockscreen", "system-lock-screen"]},
    
    {item => ['slimlock', 'Lock', 'system-lock-screen']},
    {item => ['i3lock-fancy -f reckoner', 'Fancy Lock', 'system-lock-screen']},
    
    {end  => undef},
    
    ## Sessions Menu
    {beg  => ["Logout", "application-exit"]},
    {raw  => q(<item label="Reboot" icon="/home/ryk/.config/obmenu-generator/icons/e637845681dd5bf37941eb7330c502a4.png">
                <action name="Execute">
                <prompt>Are you sure you want to Reboot?</prompt>
                <command>reboot</command>
                </action>
               </item>)},
    {raw  => q(<item label="Poweroff" icon="/home/ryk/.config/obmenu-generator/icons/b977c6d90137d53f7b90c64457867366.png">
                <action name="Execute">
                <prompt>Are you sure you want to Poweroff?</prompt>
                <command>poweroff</command>
                </action>
               </item>)},
    {sep  => undef},
    {exit => ['Exit Openbox', 'application-exit']},
    
    {end  => undef},

    ## This uses the 'oblogout' menu
    # {item => ['oblogout', 'Exit', 'application-exit']},
]
