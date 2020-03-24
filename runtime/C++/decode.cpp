#include <cstdlib>
#include <math.h>
#include <stdio.h>
#include <vector>
#include <iostream>
#include <fstream>
#include <string>
#include <time.h>

#include <boost/iostreams/filter/zlib.hpp>
#include <boost/iostreams/filtering_stream.hpp>
#include <boost/format.hpp>

void load_data()
{
    std::string line;
    int line_counter = 0;
    std::string filename = boost::str( boost::format("data"));

    //Open file
    if (FILE *file = fopen(filename.c_str(), "r"))
    {
        //File exists!, keep going!
        fclose(file);
    }else{
        std::cout<< "File " << filename << " does not exist\n";
    }

    std::ifstream infile(filename.c_str(), std::ios_base::binary);
    boost::iostreams::filtering_istream inbuf;
    inbuf.push(boost::iostreams::zlib_decompressor());
    inbuf.push(infile);
    size_t pos;
    double conc, u, v, w;
    int x, y, z;

    // while (std::getline(inbuf, line))

}

int main()
{





}