SET enable_seqscan = off;
SET optimizer = off;

CREATE UNLOGGED TABLE t (val vector(3));
INSERT INTO t (val) VALUES ('[0,0,0]'), ('[1,2,3]'), ('[1,1,1]'), (NULL);
-- start_ignore
CREATE INDEX ON t USING ivfflat (val) WITH (lists = 1);
-- end_ignore
SELECT * FROM t ORDER BY val <-> '[3,3,3]';

DROP TABLE t;
