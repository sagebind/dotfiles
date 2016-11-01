function codename
    curl -s www.codenamegenerator.com | grep -Pzo '<b>[^<]+</b>' | tr -d '<b>' | tr '\n' ' ' | cut -d '/' -f 1 | awk '{$1=$1};1'
end
