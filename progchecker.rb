#回答ファイルと解答ファイル取得
answer_files   = Dir.glob("./answer/*")
solution_files = Dir.glob("./solution/*")

#どちらかのファイルが存在しないもしくは空の場合終了
if answer_files.nil? || solution_files.nil? then
    puts "ファイルの中身が空です"
    puts "プログラムを終了します"
    exit
end

#ファイルのパスからファイル名だけ保持する配列
file_name_array = []
#ファイルのリストをソート
solution_files  = solution_files.sort
answer_files    = answer_files.sort

#回答ファイルからファイル名だけを抜き取りfile_name_arrayに格納
answer_files.each{ | array |
    file_name = array.split("/")
    file_name_array.push(file_name[2])
}

puts "照合処理"

#回答ファイルの数ループし回答ファイルを実行、出力結果と解答ファイルを比較
answer_files.each{ | array |
    indx = answer_files.index(array)
    str = "ruby " + array.to_s
    answer_output = `#{str}`
    nam = file_name_array[indx].split(".")
    print file_name_array[indx] + "  "
    nm = "./solution/" + nam[0].to_s + ".txt"
    f = File.open(nm,"r")
    a = f.read
    if answer_output == a then
        puts "◯"
    else
        puts "x"
    end
    f.close
}



#問題ファイル
#回答ファイル
#テストケース








