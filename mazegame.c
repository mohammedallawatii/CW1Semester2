#include <stdio.h>
#include <stdlib.h>

#define MAX_ROWS 100
#define MAX_COLUMNS 100
#define MIN_ROWS 5
#define MIN_COLUMNS 100

typedef struct {
    char cells[MAX_ROWS][MAX_COLUMNS];
    int height;
    int width;
    int player_row;
    int player_column;
    int exit_row;
    int exit_column;
    int game_over;
} Maze;

void loadMaze(Maze* maze, const char* filename) {
    // Use 'fopen' to open the file 'filename' in reading mode
    // check if the file is opened and if it is not opened then print a error message and exit the program
    FILE* file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error: Unable to open file %s\n", filename);
        exit(1);
    }
}

    // then you can use fscan to read two integers from the file which represent the height and width
    // see if the dimensions are in range, if not then print an error message which says "Invalid maze range" and exit the program
    // after that we use the nested loop to go over each row and column in the maze
    // after that use fscan to read a string from the file and stores it in an array, this will represent the maze layout
    // with the nested loop we can check if there are the strting point 'S', but if it is not found then an error message will appear saying "Error: No Starting Point"
    // for exit point 'E', if it is not found in the file an error message will appear saying "Error: No Exit"
    // then fclose is used to close the file after reading the maze information







int main(int argc, char *argv[]) {
    // Check if it has the correct number of command-line arguments
    // if not then it will return an error code
    if (argc != 2) {
        printf("Usage: maze <filename>");
        return EXIT_FAILURE;
    }




}

