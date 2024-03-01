#define uid(a, b) uniform_int_distribution<int>(a, b)(rng)
mt19937 rng(chrono::steady_clock::now().time_since_epoch().count());
struct UF {
	vector<int> e;
	UF(int n) : e(n, -1) {}
	bool sameSet(int a, int b) { return find(a) == find(b); }
	int size(int x) { return -e[find(x)]; }
	int find(int x) { return e[x] < 0 ? x : e[x] = find(e[x]); }
	bool join(int a, int b) {
		a = find(a), b = find(b);
		if (a == b) return false;
		if (e[a] > e[b]) swap(a, b);
		e[a] += e[b]; e[b] = a;
		return true;
	}
};
/**
 * This function does not generate a graph with self loops or multiple edges
 */
void generate_graph(bool connected = false, bool weighted = false, bool directed = false) {
    // careful with the number of vertices, maybe you need at least x
    int n = uid(1, 10), m;
    if (connected)
        m = uid(n - 1, n * (n - 1) / 2);
    else
        m = uid(0, n * (n - 1) / 2);
    cout << n << " " << m << endl;
    unordered_set<int> edges;
    if (connected) {
        UF uf(n);
        for (int i = 1; i <= n; i++) {
            int from = i, to;
            do {
                to = uid(0, i - 1);
            } while (uf.sameSet(from, to) || (directed ? edges.count(from * n + to) : edges.count(from * n + to) || edges.count(to * n + from)));
            uf.join(from, to);
            edges.insert(from * n + to);
            if (!directed)
                edges.insert(to * n + from);
            cout << from << " " << to << " " << (weighted ? to_string(uid(1, 100)) : "") << endl;
        }
        for (int i = n - 1; i < m; i++) {
            int from, to;
            do {
                from = uid(0, n - 1);
                to = uid(0, n - 1);
            } while (from == to || (directed ? edges.count(from * n + to) : edges.count(from * n + to) || edges.count(to * n + from)));
            edges.insert(from * n + to);
            if (!directed)
                edges.insert(to * n + from);
            cout << from << " " << to << " " << (weighted ? to_string(uid(1, 100)) : "") << endl;
        }
    } else {
        for (int i = 0; i < m; i++) {
            int from, to;
            do {
                from = uid(0, n - 1);
                to = uid(0, n - 1);
            } while (from == to || (directed ? edges.count(from * n + to) : edges.count(from * n + to) || edges.count(to * n + from)));
            edges.insert(from * n + to);
            if (!directed)
                edges.insert(to * n + from);
            cout << from << " " << to << " " << (weighted ? to_string(uid(1, 100)) : "") << endl;
        }
    }
}