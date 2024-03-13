#include <bits/stdc++.h>
using namespace std;
#define RESET "\033[0m"
vector<string> colors = {"\033[0;31m", "\033[0;32m", "\033[0;33m", "\033[0;34m", "\033[0;35m", "\033[0;36m", "\033[0;37m"};
int index_color = 0;
void __print(int x) { cerr << x; }
void __print(long x) { cerr << x; }
void __print(long long x) { cerr << x; }
void __print(unsigned x) { cerr << x; }
void __print(unsigned long x) { cerr << x; }
void __print(unsigned long long x) { cerr << x; }
void __print(float x) { cerr << x; }
void __print(double x) { cerr << x; }
void __print(long double x) { cerr << x; }
void __print(char x) { cerr << '\'' << x << '\''; }
void __print(const char *x) { cerr << '\"' << x << '\"'; }
void __print(const string &x) { cerr << '\"' << x << '\"'; }
void __print(bool x) { cerr << (x ? "true" : "false"); }
void _print() { cerr << endl; }
template <typename T>
void __print(const T &x);
template <typename T, typename... V>
void _print(T t, V... v);
template <typename T, typename V>
void __print(const pair<T, V> &x);
template <typename T>
void __print(vector<vector<T>> x);
template <typename T>
void __print(queue<T> x);
template <typename T>
void __print(stack<T> x);
template <typename T>
void __print(priority_queue<T> x);

template <typename T>
void __print(const T &x)
{
    int f = 0;
    cerr << "{";
    for (auto i : x)
        cerr << (f++ ? ", " : ""), __print(i);
    cerr << "}";
}

template <typename T, typename... V>
void _print(T t, V... v)
{
    cerr << colors[index_color];
    __print(t);
    cerr << RESET;
    if (sizeof...(v))
        cerr << "  ";
    index_color = (index_color + 1) % colors.size();
    _print(v...);
}

template <typename T, typename V>
void __print(const pair<T, V> &x)
{
    cerr << "(";
    __print(x.first);
    cerr << ", ";
    __print(x.second);
    cerr << ")";
}

template <typename T>
void __print(vector<vector<T>> x)
{
    cerr << "\n";
    for (int i = 0; i < (int)x.size(); i++)
    {
        if (x[i].size() == 0)
            cerr << "{}\n";
        else
            for (int j = 0; j < (int)x[i].size(); j++)
            {
                __print(x[i][j]);
                cerr << (j != (int)x[i].size() - 1 ? " " : "\n");
            }
    }
}

template <typename T>
void __print(queue<T> x)
{
    cerr << "{";
    // The front of the queue is the most left element
    while (!x.empty())
    {
        __print(x.front());
        cerr << (x.size() != 1 ? " " : "");
        x.pop();
    }
    cerr << "}";
}

template <typename T>
void __print(stack<T> x)
{
    cerr << "{";
    while (!x.empty())
    {
        __print(x.top());
        cerr << (x.size() != 1 ? " " : "");
        x.pop();
    }
    cerr << "}";
}

template <typename T>
void __print(priority_queue<T> x)
{
    cerr << "{";
    while (!x.empty())
    {
        __print(x.top());
        cerr << (x.size() != 1 ? " " : "");
        x.pop();
    }
    cerr << "}";
}

void _print_name(string names)
{
    cerr << " ";
    int index = 0;
    cerr << colors[index];
    bool flag = false;
    for (int i = 0; i < (int)names.size(); i++)
    {
        if (names[i] == '(')
            flag = true;
        if (names[i] == ')')
            flag = false;
        if (flag == false && names[i] == ',')
        {
            index = (index + 1) % colors.size();
            cerr << colors[index] << "  ";
            i++;
        }
        else
            cerr << names[i];
    }
    cerr << RESET << " : ";
}
#define dbg(x...)                                           \
    index_color = 0;                                        \
    cerr << colors[colors.size() - 2] << __LINE__ << RESET; \
    _print_name(#x);                                        \
    _print(x);
