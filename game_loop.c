/**
* @brief It defines the game loop
*
* @file game_loop.c
* @author Profesores PPROG
* @version 1.0
* @date 13-01-2015
* @copyright GNU Public License
*/

/*COMENTADO*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "graphic_engine.h"
#include "command.h"


/*-------------------------------------------------------------------------------------------------------------------*/
/*Esta función va a ser el bucle de juego, y por tanto es el archivo main de todo el juego*/

int main(int argc, char *argv[]){
  Game *game=NULL;
  Graphic_engine *gengine;
  FILE *fp;
  extern char *cmd_to_str[];

  game=game_create();

  if (argc < 4){
  		printf("Not enough parameters: %d\n", argc);
  		return 1;
  }
  fp=fopen(argv[3],"w");

  if (!game){
    fclose(fp);
    return 1;
  }

  if (!fp){
    game_destroy(game);
    return 1;
  }

  if (argc < 2){
    fprintf(stderr, "Use: %s <new_data.dat>\n", argv[0]); /*Abre el archivo data.dat*/
    return 1;
  } if (game_create_from_file(game, argv[1]) == ERROR){ /*Control de errores creación juego*/
    fprintf(stderr, "Error while initializing game.\n");
    game_destroy(game);
    return 1;
  } if ((gengine = graphic_engine_create()) == NULL){ /*Control de errores inicialización motor gráfico*/
    fprintf(stderr, "Error while initializing graphic engine.\n");
    game_destroy(game);
    return 1;
  }
  while (command_get_type(game_get_last_command(game))!=EXIT && !game_is_over(game)){ /*BUCLE DE JUEGO: mientras el comando no sea exit o gameisover no se produzca, se mantiene el bucle de juego*/
    graphic_engine_paint_game(gengine, game);
    command_get_user_input(game_get_last_command(game));
    game_update(game);   
	fprintf(fp, "%s %s\n",cmd_to_str[command_get_type(game_get_last_command(game))-NO_CMD],command_get_ob(game_get_last_command(game)));
}
  game_destroy(game);
  graphic_engine_destroy(gengine);
  fclose(fp);
  return 0;
}
