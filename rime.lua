-- --=========================================================关键字修改--==========================================================
single_keyword="single_char"	-- 单字过滤switcher参数
-- --==========================================================--==========================================================
-- encoding: utf-8
--- 过滤器：只显示单字
function single_char(input, env)
	local b = env.engine.context:get_option(single_keyword)
	local input_text = env.engine.context.input
	for cand in input:iter() do
		if (not b or utf8.len(cand.text) == 1 or table.vIn(rv_var, input_text) or input_text:find("^z") or input_text:find("^[%u%p]")) then
			yield(cand)
		end
	end
end

-- 功能比较简单,只提供日期,时间的快速输入
-- 2021年2月24日 10:48 by 环环  深山红叶优化
-- 请在方案配置文件比如wubi_mishi.schema.yaml的engine\translators:下面添加滤镜引用：
-- - lua_translator@date_translator
-- - lua_translator@week_translator

function toNyear(year,mother,day)
    --天干名称
    local cTianGan = {"甲","乙","丙","丁","戊","己","庚","辛","壬","癸"}
    --地支名称
    local cDiZhi = {"子","丑","寅","卯","辰","巳","午", "未","申","酉","戌","亥"}
    --属相名称
    local cShuXiang = {"鼠","牛","虎","兔","龙","蛇", "马","羊","猴","鸡","狗","猪"}
    --农历日期名
    local cDayName =
    {
    "*","初一","初二","初三","初四","初五",
    "初六","初七","初八","初九","初十",
    "十一","十二","十三","十四","十五",
    "十六","十七","十八","十九","二十",
    "廿一","廿二","廿三","廿四","廿五",
    "廿六","廿七","廿八","廿九","三十"
    }
    --农历月份名
    local cMonName = {"*","正","二","三","四","五","六", "七","八","九","十","十一","腊"}


    --公历每月前面的天数
    local wMonthAdd = {0,31,59,90,120,151,181,212,243,273,304,334}

    -- 农历数据
    --以下为本人修改的地方
    local wNongliData = {
    2635,333387,1701,1748,267701,694,2391,133423,1175,396438,    --- 1921--1930
    3402,3749,331177,1453,694,201326,2350,465197,3221,3402,    --- 1931--1940
    400202,2901,1386,267611,605,2349,137515,2709,464533,1738,    --- 1941--1950
    2901,330421,1242,2651,199255,1323,529706,3733,1706,398762,    --- 1951--1960
    2741,1206,267438,2647,1318,204070,3477,461653,1386,2413,    --- 1961--1970
    330077,1197,2637,268877,3365,531109,2900,2922,398042,2395,    ---1971--1980
    1179,267415,2635,661067,1701,1748,398772,2742,2391,330031,    --- 1981--1990
    1175,1611,200010,3749,527717,1452,2742,332397,2350,3222,     --- 1991--2000
    268949,3402,3493,133973,1386,464219,605,2349,334123,2709,    --- 2001--2010
    2890,267946,2773,592565,1210,2651,395863,1323,2707,265877,   --- 2011--2020
    1706,2773,133557,1206,398510,2638,3366,335142,3411,1450,     --- 2021 -- 2030
    200042,2413,723293,1197,2637,399947,3365,3410,334676,2906}    --- 2031 -- 2040


    local wCurYear,wCurMonth,wCurDay;
    local nTheDate,nIsEnd,m,k,n,i,nBit;
    local szNongli, szNongliDay,szShuXiang;

    ---取当前公历年、月、日---
    wCurYear = tonumber(year);
    wCurMonth = tonumber(mother);
    wCurDay = tonumber(day);
    ---计算到初始时间1921年2月8日的天数：1921-2-8(正月初一)---
    nTheDate = (wCurYear - 1921) * 365 + (wCurYear - 1921) / 4 + wCurDay + wMonthAdd[wCurMonth] - 38
    if (((wCurYear % 4) == 0) and (wCurMonth > 2)) then
        nTheDate = nTheDate + 1
    end


    ---------------------------
    --计算农历天干、地支、月、日---
    nIsEnd = 0;
    m = 0;

    while nIsEnd ~= 1 do
        if wNongliData[m+1] < 4095 then
            k = 11;
        else
            k = 12;
        end
        n = k;
        while n>=0 do
            --获取wNongliData(m)的第n个二进制位的值
            nBit = wNongliData[m+1];
            for i=1,n do
                nBit = math.floor(nBit/2);
            end
            nBit = nBit % 2;
            if nTheDate <= (29 + nBit) then
                nIsEnd = 1;
                break
            end
            nTheDate = nTheDate - 29 - nBit;
            n = n - 1;
        end
        if nIsEnd ~= 0 then
            break;
        end
        m = m + 1;
    end


    wCurYear = 1921 + m;
    wCurMonth = k - n + 1;
    wCurDay = nTheDate;
    if k == 12 then
        if wCurMonth == wNongliData[m+1] / 65536 + 1 then
            wCurMonth = 1 - wCurMonth;
        elseif wCurMonth > wNongliData[m+1] / 65536 + 1 then
            wCurMonth = wCurMonth - 1;
        end
    end
    wCurDay = math.floor(wCurDay)
    --print('农历', wCurYear, wCurMonth, wCurDay)
    --生成农历天干、地支、属相 ==> wNongli--
    szShuXiang = cShuXiang[(((wCurYear - 4) % 60) % 12) + 1]
    szShuXiang = cShuXiang[(((wCurYear - 4) % 60) % 12) + 1];
    szNongli = '农历' .. cTianGan[(((wCurYear - 4) % 60) % 10)+1] .. cDiZhi[(((wCurYear - 4) % 60) % 12) + 1] .. '（' .. szShuXiang .. '）年'
    --szNongli,"%s(%s%s)年",szShuXiang,cTianGan[((wCurYear - 4) % 60) % 10],cDiZhi[((wCurYear - 4) % 60) % 12]);


    --生成农历月、日 ==> wNongliDay--*/
    if wCurMonth < 1 then
        szNongliDay = "闰" .. cMonName[(-1 * wCurMonth) + 1]
    else
        szNongliDay = cMonName[wCurMonth+1]
    end


    szNongliDay = szNongliDay .. "月" .. cDayName[wCurDay+1]

    return szNongli .. szNongliDay
end


--- date/time translator
word=0 --单字优先模式参数


function date_translator(input, seg)
    if (input == "date" or input == "iikf" or input == "now" or input == "dqrq" or input == "rq" or input == "riqi" or input == "nyr") then
        --普通日期1，类似2020年02月04日
        date1=os.date("%Y年%m月%d日")
        date_y=os.date("%Y") --取年
        date_m=os.date("%m") --取月
        date_d=os.date("%d") --取日



        --普通日期2，类似2020年2月4日
        num_m=os.date("%m")+0
        num_m1=math.modf(num_m)
        num_d=os.date("%d")+0
        num_d1=math.modf(num_d)
        date2=os.date("%Y年")..tostring(num_m1).."月"..tostring(num_d1).."日"


        --大写日期，类似二〇二〇年十一月二十六日
        date_y=date_y:gsub("%d",{
        ["1"]="一",
        ["2"]="二",
        ["3"]="三",
        ["4"]="四",
        ["5"]="五",
        ["6"]="六",
        ["7"]="七",
        ["8"]="八",
        ["9"]="九",
        ["0"]="〇",
        })
        date_y=date_y.."年"

        date_m=date_m:gsub("%d",{
        ["1"]="一",
        ["2"]="二",
        ["3"]="三",
        ["4"]="四",
        ["5"]="五",
        ["6"]="六",
        ["7"]="七",
        ["8"]="八",
        ["9"]="九",
        ["0"]="",
        })
        date_m=date_m.."月"
        if num_m1==10 then date_m="十月" end
        if num_m1==11 then date_m="十一月" end
        if num_m1==12 then date_m="十二月" end

        date_d=date_d:gsub("%d",{
        ["1"]="一",
        ["2"]="二",
        ["3"]="三",
        ["4"]="四",
        ["5"]="五",
        ["6"]="六",
        ["7"]="七",
        ["8"]="八",
        ["9"]="九",
        ["0"]="",
        })
        date_d=date_d.."日"
        if num_d1>9 then
            if num_d1<19 then
                date_d="十"..string.sub(date_d,4,#date_d)
            end
        end
        if num_d1>19 then date_d=string.sub(date_d,1,3).."十"..string.sub(date_d,4,#date_d) end
        date3=date_y..date_m..date_d

        --农历
        date4=toNyear(os.date("%Y"),os.date("%m"),os.date("%d"))
        date4=date4:gsub("年","年")

        --星期
        local day_w=os.date("%w")
        local day_w1=""
        if day_w=="0" then day_w1="星期日" end
        if day_w=="1" then day_w1="星期一" end
        if day_w=="2" then day_w1="星期二" end
        if day_w=="3" then day_w1="星期三" end
        if day_w=="4" then day_w1="星期四" end
        if day_w=="5" then day_w1="星期五" end
        if day_w=="6" then day_w1="星期六" end


        yield(Candidate("date", seg.start, seg._end, date2, " "))
        yield(Candidate("date", seg.start, seg._end, date3, " "))


        yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), " "))
        yield(Candidate("date", seg.start, seg._end, os.date("%Y%m%d"), " "))
        --# yield(Candidate("date", seg.start, seg._end, date1, " ")) #这种单位数日期前面添加前缀0的格式为国家公文标准明令禁止的，不建议使用
        --# yield(Candidate("date", seg.start, seg._end, day_w1, " "))
        yield(Candidate("date", seg.start, seg._end, date4, " "))
    end


    if (input == "/1") then
    -- Candidate(type, start, end, text, comment)
        if (word == 0) then
            word=1
            yield(Candidate("date", seg.start, seg._end, "单字优先模式启用", " 配置"))
        else
            word=0
            yield(Candidate("date", seg.start, seg._end, "单字优先模式关闭", " 配置"))
        end
    end
    if (input == "time" or input == "icci" or input == "sj" or input == "dqsj") then
        yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), " "))
        yield(Candidate("time", seg.start, seg._end, os.date("%H点%M分"), " "))
        yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), " "))
        yield(Candidate("time", seg.start, seg._end, os.date("%H点%M分%S秒"), " "))
    end
end


function time_translator(input, seg)
    if (input == "/time") then
        yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), " 时间"))
    end
end


function week_translator(input, seg)
    if (input == "week" or input == "xq" or input == "xqj" or input == "irkf") then
        if (os.date("%w") == "0") then
            weekstr = "日"
        end
        if (os.date("%w") == "1") then
            weekstr = "一"
        end
        if (os.date("%w") == "2") then
            weekstr = "二"
        end
        if (os.date("%w") == "3") then
            weekstr = "三"
        end
        if (os.date("%w") == "4") then
            weekstr = "四"
        end
        if (os.date("%w") == "5") then
            weekstr = "五"
        end
        if (os.date("%w") == "6") then
            weekstr = "六"
        end
        yield(Candidate("week", seg.start, seg._end, os.date("星期")..weekstr,""))
    end
end

