game_board = ["\s", "\s", "\s", "\s", "\s", "\s", "\s", "\s", "\s"]
game_on = 0
winner = 0
game_type = 0


puts "Would you like to play against a friend or me?"
loop do
    puts "Enter 2 to play your friend and 1 to play the computer."
    game_type  = gets.to_i 
    #Evaluate t
    if game_type == 1  || game_type == 2    
        break
    else 
        puts "\nUnfortunately I can only support 1 or 2 player games.\n"  
    end
end



begin
    # Build the input key guide
    puts
    #Displaying the game board
    puts "\t\t\t============="
    puts "\t1|2|3\t\t| #{game_board[0]} | #{game_board[1]} | #{game_board[2]} |"
    puts "\t-+-+-\t\t============="
    puts "\t4|5|6\t\t| #{game_board[3]} | #{game_board[4]} | #{game_board[5]} |"
    puts "\t-+-+-\t\t============="
    puts "\t7|8|9\t\t| #{game_board[6]} | #{game_board[7]} | #{game_board[8]} |"
    puts "\t\t\t============="
    puts


    #The human move
    loop do
        if game_type == 2
            puts "Player 1, using keys 1 to 9 as diagrammed to the left,\nin which square will you draw the X?"
        else
            puts "Using keys 1 to 9 as diagrammed to the left,\nin which square will you draw the X?"
        end
        move  = gets.to_i - 1 
        #Evaluate the move
        if game_board[move] == "\s" 
            game_board[move] = 'X'
            break
        else 
            puts "\nYour move of #{move+1} is not allowed.\nYou will need to make another move.\n"  
        end
    end


    #Check for human win
    case 
        #horizontals
        when game_board[0] == 'X' &&  game_board[1] == 'X' && game_board[2] == 'X' then winner = 1 and break
        when game_board[3] == 'X' &&  game_board[4] == 'X' && game_board[5] == 'X' then winner = 1 and break      
        when game_board[6] == 'X' &&  game_board[7] == 'X' && game_board[8] == 'X' then winner = 1 and break
        #verticals
        when game_board[0] == 'X' &&  game_board[3] == 'X' && game_board[6] == 'X' then winner = 1 and break
        when game_board[1] == 'X' &&  game_board[4] == 'X' && game_board[7] == 'X' then winner = 1 and break      
        when game_board[2] == 'X' &&  game_board[5] == 'X' && game_board[8] == 'X' then winner = 1 and break
        #diagonals
        when game_board[0] == 'X' &&  game_board[4] == 'X' && game_board[8] == 'X' then winner = 1 and break
        when game_board[2] == 'X' &&  game_board[4] == 'X' && game_board[6] == 'X' then winner = 1 and break
    end

    #Game counter for Tie Game
    game_on +=1
    if game_on == 5
        break
    end


    #Display board once for player 2
    if game_type == 2
        puts "\t\t\t============="
        puts "\t1|2|3\t\t| #{game_board[0]} | #{game_board[1]} | #{game_board[2]} |"
        puts "\t-+-+-\t\t============="
        puts "\t4|5|6\t\t| #{game_board[3]} | #{game_board[4]} | #{game_board[5]} |"
        puts "\t-+-+-\t\t============="
        puts "\t7|8|9\t\t| #{game_board[6]} | #{game_board[7]} | #{game_board[8]} |"
        puts "\t\t\t============="
        puts
    end

    #Computer or Player 2 move
    loop do
        if game_type == 2

            puts "Player 2, using keys 1 to 9 as diagrammed to the left,\nin which square will you draw the O?"
            move  = gets.to_i - 1 
            #Evaluate the move
            if game_board[move] == "\s" 
                game_board[move] = 'O'
                break
            else 
                puts "\nYour move of #{move+1} is not allowed.\nYou will need to make another move.\n"  
        end

        else
            comp_move = rand(9)
            if game_board[comp_move] == "\s" 
                game_board[comp_move] = 'O'
                break
            end            
        end
    end


    #Check for computer win
    case 
        #horizontals
        when game_board[0] == 'O' &&  game_board[1] == 'O' && game_board[2] == 'O' then winner = 2 and break
        when game_board[3] == 'O' &&  game_board[4] == 'O' && game_board[5] == 'O' then winner = 2 and break      
        when game_board[6] == 'O' &&  game_board[7] == 'O' && game_board[8] == 'O' then winner = 2 and break
        #verticals
        when game_board[0] == 'O' &&  game_board[3] == 'O' && game_board[6] == 'O' then winner = 2 and break
        when game_board[1] == 'O' &&  game_board[4] == 'O' && game_board[7] == 'O' then winner = 2 and break      
        when game_board[2] == 'O' &&  game_board[5] == 'O' && game_board[8] == 'O' then winner = 2 and break
        #diagonals
        when game_board[0] == 'O' &&  game_board[4] == 'O' && game_board[8] == 'O' then winner = 2 and break
        when game_board[2] == 'O' &&  game_board[4] == 'O' && game_board[6] == 'O' then winner = 2 and break
    end

 end until game_on == 5



puts "\t\t============="
puts "\t\t| #{game_board[0]} | #{game_board[1]} | #{game_board[2]} |"
puts "\t\t============="
puts "\t\t| #{game_board[3]} | #{game_board[4]} | #{game_board[5]} |"
puts "\t\t============="
puts "\t\t| #{game_board[6]} | #{game_board[7]} | #{game_board[8]} |"
puts "\t\t============="
puts

#Winning Annoucment
case
    when game_type == 1 && winner == 1 then puts "\t\t!!! You won !!!"
    when game_type == 1 && winner == 2 then puts "\t\t!!  The random computer beat you :-("
    when game_type == 1 && winner == 0 then puts "\t\t!!  Tie Game  !!"
    when game_type == 2 && winner == 1 then puts "\t\t!!! Player 1, Mr. X Wins !!!"
    when game_type == 2 && winner == 2 then puts "\t\t!!  Player 2, Ms. O Wins !!!"
    when game_type == 2 && winner == 0 then puts "\t\t!!  You two can not beat each other !!"
end
