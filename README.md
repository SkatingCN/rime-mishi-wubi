# 米十五笔输入方案 for 小狼毫(Windows)、鼠须管(macOS)、中州韵(Ubuntu) 
## 一、概述
<br>[Rime](https://rime.im/)  是个输入法内核，在它的基础之上，又出现了涵盖 Windows、macOS、Linux 三个常用系统平台的输入法，对应的输入法名分别为小狼毫、鼠须管、中州韵。
<br>该输入法具有高度可定制化的特性，输入法通过读取不同的配置文件，来实现不同输入方式（米十五笔、全拼、双拼等），设置不同的输入习惯：二三候选、回车清码、/键拼音反查等等。正因为如此高的可自定义性，拉高了它的使用门槛。为了让更多的米十五笔输入法用户更省心地使用 Rime 输入米十五笔，就有了当前这个米十五笔输入方案，它的输入习惯比较接近于之前的极点五笔。
<br>由于三个平台使用的码表配置文件是一样的，所以能够在多个平台间保持同一种输入习惯，打起字来也会比较舒服。该码表词条不是很多，很多专业性的词语可能会没有，需要自己添加，可以临时自动造词模式来完成词条的添加。<br/>
## 二、安装
### 1. Windows（小狼毫）
<br>① 到[官网下载](https://rime.im/download/)相关链接下载，按步骤安装；
<br>② 右击状态栏中的小狼毫输入法图标（中字），选择“用户文件夹”，把本项目中的文件（含文件夹）复制到里面，右击状态栏中的小狼毫输入法图标（中字），选择“重新部署 即可。
<br>**注意**： Rime 目录下的 `Build` 目录是程序生成的，不要把配置文件放在那里面，无视它即可。<br/>
## 2. macOS（鼠须管）
<br>① 到[官网下载](https://rime.im/download/)相关链接下载，按步骤安装；
<br>② macOS 上的鼠须管配置文件存放目录是 `~/Library/Rime`，把本项目中的文件（含文件夹）移到 `Rime` 目录中，点击状态栏上的输入法图标，下拉菜单中选择“部署 (英文是`Deploy`）”，或者可以直接使用快捷键 <kbd>control</kbd> + <kbd>option</kbd> + <kbd>~</kbd> 
<br>**注意**：Rime 目录下的 Build 目录是程序生成的，不要把配置文件放在那里面，无视它即可。
<br>放的时候目录结构是这样的：
```bash
~/Library/
└── Rime
    ├── 该项目中的文件
    ├── 该项目中的文件
    ├── 该项目中的文件
    ├── ...
    ├── ...
```
<br>**注意**：对于不熟悉命令行操作的朋友， `~` 代表的是当前用户的主目录，比如我的用户名是 `kyle`, `~` 就代表 `/Users/kyle/` 这个绝对路径。 需要将你下载的文件放入 `/Users/你用户名/Library/Rime` 这个目录下，明白了吗？<br/>
### 3. Ubuntu (ibus-rime)
<br>执行下面指令安装 `ibus-rime` 输入法
```bash
sudo apt-get install ibus-rime
```
<br>ubuntu 的配置文件目录在
```bash
~/.config/ibus/rime/
```
## 三、扩展词库
<br>默认已添加的词库有：
```yaml
    - mishi_wubi                          # 米十五笔词库
    - mishi_wubi_extra                    # 扩展词库
    - mishi_wubi_extra_district           # 扩展词库 - 行政区域（默认不启用）
    - mishi_wubi_user.dict.yaml           # 用户词库（用户常用而以上词库未收录的词，可自行添加到该词库）
```
<br>可以通过修改 `mishi_wubi.dict.yaml` 文件头部的部分来启用、停用某一个词库。
<br>比如想启用（停用）“行政区域”这个词库，直接直接删除该行前面的 `#` （在该行前面添加 `#` ），执行输入法的“重新部署”操作后即可生效。“行政区域”这个词库有 3000 多个词条，可能会导致重码变多，可以根据自己需要删减其内容，文件中已经根据省份划分地域名了。<br/>
## 四、使用说明
### 1. 组合键
<br><kbd>control</kbd> + <kbd>`</kbd>		切换方案<br/>
<br><kbd>control</kbd> + <kbd>shift</kbd> + <kbd>E</kbd>		emoji显隐<br/>
<br><kbd>control</kbd> + <kbd>shift</kbd> + <kbd>U</kbd>		字集选择<br/>
<br><kbd>control</kbd> + <kbd>shift</kbd> + <kbd>K</kbd>		单字模式<br/>
### 2. 选项菜单
<br>在输入状态时，<kbd>control</kbd> + <kbd>0</kbd>  弹出菜单。
<br>弹出的菜单中，处于第一位的是当前使用的输入法方案，其后跟着是该方案中的输入法菜单，有【半 - 全】【简 - 繁】等常见功能菜单，再后面是其它可选的输入法方案，对应 `default.custom.yaml` 中 `schema_list` 字段内容。<br/>
### 3. 五笔拼音混输
<br>在 `default.custom.yaml` 文件中罗列着可选的方案，已经注明具体方案的作用，如果你想五笔拼音混输，可以将混输方案移至最上面。<br/>
### 4. 默认二三候选
<br>默认的二三候选是<kbd>;</kbd> <kbd>'</kbd> 两个键<br/>
### 5. 候选翻页
<br>方向  <kbd>上↑</kbd><kbd>下↓</kbd> 或 <kbd>左←</kbd><kbd>右→</kbd>
<br>翻页   <kbd>-</kbd> <kbd>=</kbd> 或 <kbd>page_up</kbd> <kbd>Page_Down</kbd>
### 6. 临时拼音输入
<br><kbd>/</kbd>键可以进入临时拼音输入模式，拼音输入的字词支持米十五笔编码反查。<br/>
### 7. 支持 简入繁出
<br>是以切换输入方案的形式实现的，使用时，按组合键 <kbd>control</kbd> + <kbd>shift</kbd> + <kbd>F</kbd>（或<kbd>control</kbd> + <kbd>`</kbd> 调出菜单，选择“简入繁出”方案）即可。
<br>以不切换文字的形式使用只是暂时转繁，换个程序就会恢复简体了。如果你想一直使用简入繁出就选择 「简入繁出」这个方案。<br/>
### 8. 单字派
<br>在输入状态时，按组合键 <kbd>control</kbd> + <kbd>shift</kbd> + <kbd>K</kbd>（或<kbd>control</kbd> + <kbd>`</kbd> 调出菜单，使用方向键移到“简｜扩｜🈶️｜词｜。｜半｜”，按空格键，在接着弹出的子菜单中，使用方向键移到“词️→单️”（默认“词”），再次按空格键即可。
<br>单字模式只是暂时（用于学习），换个程序就不再是单字模式了。<br/>
### 9. 系统 时间、日期 和 星期
<br>输入对应词，获取当前日期和时间。
* date 输出日期，格式  2023年2月25日  二〇二三年二月二十五日  2023-02-25  20230225  农历癸卯（兔）年二月初六
* time 输出时间，格式  10:00  10点00分  10:00:06  10点00分06秒
* week 输出星期，格式  星期六<br/>
### 10. 支持大写数字输入：壹贰叁肆伍陆
<br>本码表配置中包含一个可以输入大写数字的方案，名叫“大写数字”，呼出菜单选择该方案即可。
<br>在这个模式下：具体可以看源文件 `numbers.schema.yaml`<br/>

| 键   | 对应值 | 键 (按住 shift) | 对应值 |
| --- | --- | --- | --- |
| 1234567890 | 壹贰叁肆伍陆柒捌玖零 | 1234567890 | 一二三四五六七八九〇 |
| wqbsjfd. | 万仟佰拾角分第点 | wqbsjfd. | 万千百十角分点 |
| z   | 整之  | z   | 整之  |
| y   | 元月亿 | y   | 元月亿 |

### 11. 数字符号输入
<br>系列符号编码取符号名称的拼音首码。录入时先按 <kbd>z</kbd> 键，再输入系列符号的编码，具体如下：
<br>zbd -> 标点符号[标点(bd)]、zys -> 圆圈数字[圆数(ys)]、zks -> 括号数字[括数(ks)]、zds -> 带点数字[点数(ds)]、zdw -> 单位符号[单位(dw)]、zde -> 大写俄文[大俄(de)]、zxe -> 小写俄文[小俄(xe)]、zjt -> 方向箭头[箭头(jt)]、zdl -> 大写罗马[大罗(dl)]、zxl -> 小写罗马[小罗(xl)]、zpp -> 偏旁部首[偏旁(pp)]、zpy -> 拼音符号[拼音(py)]、zpj -> 日文平假名[平假(pj)]、zjp -> 日文片假名[片假(jp)]、zsx -> 数学符号[数学(sx)]、zts -> 特殊符号[特殊(ts)]、zdx -> 大写希腊[大希(dx)]、zxx -> 小写希腊[小希(xx)]、zzs -> 中文数字[中数(zs)]、zzb -> 制表符号[制表(zb)]、zzy -> 注音符号[注音(zy)]、zhb -> 货币符号[货币(hb)]、zsb -> 上标符号[上标(sb)]、zxb -> 下标符号[下标(xb)]。<br/>

## 五、常见自定义功能
### 1. 候选个数
<br>默认是9，可以自定义候选面板中的候选词的个数，编辑 `default.custom.yaml` 中以下这段，修改成你想要的个数即可，最多支持10个。
```yaml
  menu:
      page_size: 9      # 候选词数量，最多支持 10 个
```
### 2. 回车清码
<br>默认是开启的。
<br>想要关闭，打开 `default.custom.yaml` 文件，找到下面这行，在前面添加 `#` 即可，如下
```yaml
      # 回车清码
      - { when: composing, accept: Return, send: Escape }
```
### 3. 空码时自动清码
<br>默认配置是不会自动清的，想要自动清码，修改文件 `mishi_wubi.schema.yaml` 中 `speller` 这一栏，将前面的 `# `号删除即可，如下
```yaml
  auto_clear: max_length                # 空码时自动清空
```
### 4. 编码提示
<br>默认是开启的， 想要关闭，打开 `mishi_wubi.schema.yaml` 编辑 `translator` -> `comment_format` 改成如下即可。
```yaml
  comment_format: 
#    - xform/.+//                       # 注释掉该行，即可显示词条编码
```
### 5. 关于手动造词功能
<br>    手动往用户词库（`mishi_wubi_user.dict.yaml`）中添加词组，并重新部署。
<br>    这个操作要注意的是词组与编码之间的符号是`tab`，写错了这个词是不会被识别的。<br/>
### 6. 临时自动造词（精准造词）模式
<br>正常中文输入模式下，不会进行自动造词，只有按 <kbd>～</kbd> 键才会进入临时自动造词模式（保存在用户文件夹的 `mishi_wubi.userdb`）。
<br> 输入单字编码（1～4位）后使用 <kbd>～</kbd> 键分隔编码，并继续输入新的单字编码，连续输完欲组词单字编码后，如上屏词不对，使用方向键（<kbd>←</kbd><kbd>→</kbd>或<kbd>↑</kbd><kbd>↓</kbd>）依次定位到正确候选字并按空格键确认。使用空格键将选中的词组上屏后即自动学习为新词组。造好的词上屏后不能回删，否则不记录。造好的词需再次上屏才能转正。
<br>删词操作：定位到要删除的词条上面按<kbd>Shift</kbd>+<kbd>Delete</kbd>删除，此操作只对造词有效！
<br>**注意**：无法使用四码唯一自动上屏的功能。<br/>
### 7. 开启四码唯一自动上屏
<br>需要修改 `mishi_wubi.schema.yaml` 下面几个内容
```bash
speller:
  # max_code_length: 4                 # 四码上屏
  auto_select: false                   # 自动上屏

translator:
  enable_sentence: true                # 句子输入模式
  enable_user_dict: true               # 是否开启用户词典（用户词典记录动态字词频，用户词）
  enable_encoder: true                 # 是否开启自动造词
```
<br>**注意**：无法使用临时自动造词（精准造词）模式。<br/>

## 六、其它相关链接
__米十五笔输入法__
- [x] 米十五笔输入法官方主页：  [http://www.jpwb.cc/MJWB.htm](http://www.jpwb.cc/MJWB.htm)

__Rime 资源链接__
- [x] Rime github 地址：  [https://github.com/rime](https://github.com/rime)
- [x] Rime 输入方案集合：  [https://github.com/rime/plum](https://github.com/rime/plum)
- [x] Rime 简拼输入方案：  [https://github.com/rime/rime-pinyin-simp](https://github.com/rime/rime-pinyin-simp)
- [x] 86版极点五笔的输入配置方案： [https://github.com/KyleBing/rime-wubi86-jidian](https://github.com/KyleBing/rime-wubi86-jidian)

__字体资源链接__
- [x] 遍黑体：  [https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project](https://github.com/Fitzgerald-Porthmouth-Koenigsegg/Plangothic-Project)
- [x] Noto Color Emoji Font：  [https://github.com/googlefonts/noto-emoji]( https://github.com/googlefonts/noto-emoji)
