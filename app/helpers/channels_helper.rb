module ChannelsHelper
    def index_th(index)
        match1 = { "1" => "한", "2" => "두", "3" =>"세", "4" => "네", "5" => "다섯", "6" => "여섯", "7" => "일곱", "8" => "여덟", "9" => "아홉"}
        match2 = { "1" => "열", "2" => "스물", "3" =>"서른", "4"=>"마흔", "5"=>"쉰", "6"=>"예순", "7" => "일흔", "8" => "여든", "9" => "아흔"}
        match_arr = [match1, match2]

        res = ""
        index.to_s.reverse.each_char.with_index do |char, i|
            res = "#{match_arr[i][char]}#{res}"
        end

        if res == "한"
            res = "첫"
        elsif res == "스물"
            res = "스무"
        end
        res = res + " 번째 일지"
    end
end
