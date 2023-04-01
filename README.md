米十五笔输入方案 for 小狼毫(Windows)、中州韵(Ubuntu) 、鼠须管(macOS)
====
# 一、概述
<br>Rime 是个输入法内核，在它的基础之上，又出现了涵盖 Windows、macOS、Linux 三个常用系统平台的输入法，对应的输入法名分别为小狼毫、鼠须管、中州韵。<br/>
<br>该输入法具有高度可定制化的特性，输入法通过读取不同的配置文件，来实现不同输入方式（米十五笔、全拼、双拼等），设置不同的输入习惯：二三候选、回车清码、/键拼音反查等等。正因为如此高的可自定义性，拉高了它的使用门槛。为了让更多的米十五笔用户更省心地使用 Rime 输入米十五笔，就有了当前这个米十五笔输入方案，它的输入习惯比较接近于之前的极点五笔。<br/>
<br>由于三个平台使用的码表配置文件是一样的，所以能够在多个平台间保持同一种输入习惯，打起字来也会比较舒服。该码表词条不是很多，很多专业性的词语可能会没有，需要自己添加，可以临时自动造词模式来完成词条的添加。<br/>
# 二、安装（米十五笔配置文件在 Rime 文件夹中）
## 1. Windows（小狼毫）
<br>① 到[官网](https://rime.im/download/)相关链接下载小狼毫并安装；<br/>
<br>② 右击状态栏中的小狼毫输入法图标（中字），选择“用户文件夹”，把 Rime 文件夹中的文件（含文件夹）复制到里面，右击状态栏中的小狼毫输入法图标（中字），选择“重新部署 即可。<br/>
<br>注意： Rime 目录下的 Build 目录是程序生成的，不要把配置文件放在那里面，无视它即可。<br/>
## 2. macOS（鼠须管）
<br>① 到[官网](https://rime.im/download/)相关链接下载，按步骤安装即可；<br/>
<br>② macOS 上的鼠须管配置文件存放目录是 ~/Library/Rime，把 Rime 文件夹中的文件（含文件夹）移到 Rime 目录中，点击状态栏上的输入法图标，下拉菜单中选择“部署 (英文是Deploy）”，或者可以直接使用快捷键 control + option + ~ <br/>
<br>注意：Rime 目录下的 Build 目录是程序生成的，不要把配置文件放在那里面，无视它即可。需要将你下载的文件放入 /Users/你用户名/Library/Rime 这个目录下，明白了吗？<br/>
## 3. Ubuntu (ibus-rime)
<br>执行下面指令安装 ibus-rime 输入法<br/>
<br>sudo apt-get install ibus-rime<br/>
<br>ubuntu 的配置文件目录在<br/>
<br>~/.config/ibus/rime/<br/>
# 三、扩展词库
    默认已添加的词库有：
    - mishi_wubi                          # 米十五笔词库
    - mishi_wubi_extra                    # 扩展词库
    - mishi_wubi_extra_district           # 扩展词库 - 行政区域（默认不启用）
    - mishi_wubi_user.dict.yaml           # 用户词库（用户常用而以上词库未收录的词，可自行添加到该词库）

<br>可以通过修改 mishi_wubi.dict.yaml 文件头部的部分来启用、停用某一个词库。<br/>
<br>比如想启用（停用）“行政区域”这个词库，直接直接删除该行前面的 # （在该行前面添加 # ），执行输入法的“重新部署”操作后即可生效。“行政区域”这个词库有 3000 多个词条，可能会导致重码变多，可以根据自己需要删减其内容，文件中已经根据省份划分地域名了。<br/>

# 四、使用说明
## 1. 选项菜单
<br>在输入状态时，control + 0 或者 shift + control + 0 弹出菜单。<br/>
<br>弹出的菜单中，处于第一位的是当前使用的输入法方案，其后跟着是该方案中的输入法菜单，有【半角 - 全角】【简体 - 繁体】等常见功能菜单，再后面是其它可选的输入法方案，对应 default.custom.yaml 中 schema_list 字段内容。<br/>

## 2. 五笔拼音混输
<br>在 default.custom.yaml 文件中罗列着可选的方案，已经注明具体方案的作用，如果你想五笔拼音混输，可以将混输方案移至最上面。<br/>

## 3. 默认二三候选
<br>默认的二三候选是 ; ' 两个键<br/>

## 4. 候选翻页
<br>方向  上↑下↓ 或 左←右→<br/>
<br>翻页   - = 或 page_up Page_Down<br/>
<br>默认已关闭 [ ] 的上下翻页功能，如果需要请修改 default.custom.yaml 内容。<br/>

## 5. 临时拼音输入
<br>/键可以进入临时拼音输入模式，拼音输入的字词支持米十五笔编码反查。<br/>

## 6. 支持 简入繁出
<br>是以切换输入方案的形式实现的，使用时，调出菜单，选择“简入繁出”方案即可。<br/>
<br>以不切换文字的形式使用只是暂时转繁，换个程序就会恢复简体了。如果你想一直使用简入繁出就选择 「简入繁出」这个方案。<br/>

## 7. 系统 时间、日期 和 星期
<br>输入对应词，获取当前日期和时间。<br/>
<br>date 输出日期，格式  2023年2月25日  二〇二三年二月二十五日  2023-02-25  20230225  农历癸卯（兔）年二月初六<br/>
<br>time 输出时间，格式  10:00  10点00分  10:00:06  10点00分06秒<br/>
<br>week 输出星期，格式  星期六<br/>

## 8. 支持大写数字输入：壹贰叁肆伍陆
<br>本码表配置中包含一个可以输入大写数字的方案，名叫“大写数字”，呼出菜单选择该方案即可。<br/>
<br>在这个模式下：具体可以看源文件 numbers.schema.yaml<br/>

| 键   | 对应值 | 键 (按住 shift) | 对应值 |
| --- | --- | --- | --- |
| 1234567890 | 壹贰叁肆伍陆柒捌玖零 | 1234567890 | 一二三四五六七八九〇 |
| wqbsjfd. | 万仟佰拾角分第点 | wqbsjfd. | 万千百十角分点 |
| z   | 整之  | z   | 整之  |
| y   | 元月亿 | y   | 元月亿 |

## 9. 数字符号输入
<br>系列符号编码取符号名称的拼音首码。录入时先按 z 键，再输入系列符号的编码，具体如下：<br/>
<br>zbd -> 标点符号[标点(bd)]、zys -> 圆圈数字[圆数(ys)]、zks -> 括号数字[括数(ks)]、zds -> 带点数字[点数(ds)]、zdw -> 单位符号[单位(dw)]、zde -> 大写俄文[大俄(de)]、zxe -> 小写俄文[小俄(xe)]、zjt -> 方向箭头[箭头(jt)]、zdl -> 大写罗马[大罗(dl)]、zxl -> 小写罗马[小罗(xl)]、zpp -> 偏旁部首[偏旁(pp)]、zpy -> 拼音符号[拼音(py)]、zpj -> 日文平假名[平假(pj)]、zjp -> 日文片假名[片假(jp)]、zsx -> 数学符号[数学(sx)]、zts -> 特殊符号[特殊(ts)]、zdx -> 大写希腊[大希(dx)]、zxx -> 小写希腊[小希(xx)]、zzs -> 中文数字[中数(zs)]、zzb -> 制表符号[制表(zb)]、zzy -> 注音符号[注音(zy)]、zhb -> 货币符号[货币(hb)]、zsb -> 上标符号[上标(sb)]、zxb -> 下标符号[下标(xb)]。<br/>

# 五、常见自定义功能
## 1. 候选个数
<br>默认是7，可以自定义候选面板中的候选词的个数，编辑 default.custom.yaml 中以下这段，修改成你想要的个数即可，最多支持10个。<br/>
<br>menu:<br/>
<br>  page_size: 7      # 候选词数量，最多支持 10 个<br/>

## 2. 回车清码
<br>默认是开启的。<br/>
<br>想要关闭，打开 default.custom.yaml 文件，找到下面这行，在前面添加 # 即可，如下<br/>
<br># 回车清码
<br>- { when: composing, accept: Return, send: Escape }<br/>

## 3. 空码时自动清码
<br>默认配置是不会自动清的，想要自动清码，修改文件 mishi_wubi.schema.yaml 中 speller 这一栏，将前面的 # 号删除即可，如下<br/>
<br>  auto_clear: max_length                # 空码时自动清空<br/>

## 4. 编码提示
<br>默认是开启的， 想要关闭，打开 mishi_wubi.schema.yaml 编辑 translator -> comment_format 改成如下即可。<br/>
<br>  comment_format: <br/>
<br>    - xform/.+//                       去掉该行# 注释，即可关闭词条编码<br/>

## 5. 关于手动造词功能
<br>    手动往用户词库（mishi_wubi_user.dict.yaml）中添加词组，并重新部署。<br/>
<br>    这个操作要注意的是词组与编码之间的符号是tab，写错了这个词是不会被识别的。<br/>

## 6. 临时自动造词（精准造词）模式
<br>正常中文输入模式下，不会进行自动造词，只有按 ` 键才会进入临时自动造词模式（保存在用户文件夹的 mishi_wubi.userdb）。<br/>
<br> 输入单字编码（1～4位）后使用 ` 键分隔编码，并继续输入新的单字编码，连续输完欲组词单字编码后，如上屏词不对，使用方向键（←→或↑↓）依次定位到正确候选字并按空格键确认。使用空格键将选中的词组上屏后即自动学习为新词组。造好的词上屏后不能回删，否则不记录。造好的词需再次上屏才能转正。<br/>
<br>删词操作：定位到要删除的词条上面按Shift+Delete删除，此操作只对造词有效！<br/>
<br>注意: 无法使用四码唯一自动上屏的功能。<br/>

## 7. 开启四码唯一自动上屏
<br>需要修改 mishi_wubi.schema.yaml 下面几个内容<br/>
<br>speller:<br/>
<br>  # max_code_length: 4                 # 四码上屏<br/>
<br>  auto_select: true                   # 自动上屏<br/>

<br>translator:<br/>
<br>  enable_sentence: false                # 句子输入模式<br/>
<br>  enable_user_dict: false               # 是否开启用户词典（用户词典记录动态字词频，用户词）<br/>
<br>  enable_encoder: false                 # 是否开启自动造词<br/>
<br>注意: 无法使用临时自动造词（精准造词）模式。<br/>

## 8. 单字派
<br>如果你是单字派，只打单字，可以修改 mishi_wubi.schema.yaml 这个文件，找到以下位置，根据需要去除对应行前面的 #，重新部署即可生效。<br/>
<br>filters:<br/>
<br>#   - lua_filter@single_char_first_filter # 单字优先<br/>
<br>#    - lua_filter@single_char_only # 纯单字<br/>
# 六、致谢
<br>感谢米十五笔输入法的发明人李明先生、「Rime/中州韵」输入法引擎的开发者佛振先生、以及分享的 Rime 定制方案的 KyleBing、f1ynng8、yanhuacuo！<br/>

