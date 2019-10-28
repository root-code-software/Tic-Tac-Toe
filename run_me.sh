OS="`uname`"
case $OS in
  'Linux')
    OS='Linux'
    echo 'linux'
    chmod 755 bin/main.rb
    ;;
  'WindowsNT')
    OS='Windows'
    echo 'windows'
    ;;
  'Darwin') 
    OS='Mac'
    echo 'mac'
    ;;
  *) ;;
esac